// ecat_actuator.c
#include <timing.h>
#include <devices.h>
#include "hardware.h"
#include <drv_spi.h>
#include <per_pwmx.h>
#include <drv_pwmx.h>
#include "utypes.h"
#include "esc.h"
//#include "esc_foe.h"
//#include "spi.h"

void clear_pwm(void);

struct __packed__ {
//    uint8 res:2;                 //bit 6..7
    uint8 disable_m2:1;
    uint8 disable_m1:1;
    uint8 direction_m3:1;
    uint8 direction_m2:1;
    uint8 m1_pwm_d:1;
    uint8 m1_pwm_c:1;
    uint8 direction_m1:1;
    uint8 led:1;                 //bit 0
} *IOp_lo = (void *)Base_GPIO1;

struct __packed__ {
    uint8 pwm_m1_mode1:1;        //bit 7
    uint8 pwm_m1_mode2:1;
    uint8 pwm_m2_3_mode1:1;
    uint8 pwm_m2_3_mode2:1;
    uint8 pwm_m1_reset_AB:1;
    uint8 pwm_m1_reset_CD:1;
    uint8 pwm_m2_reset_AB:1;
    uint8 pwm_m3_reset_CD:1;     //bit 0
} *IOp_hi = (void *)(Base_GPIO1+1);

uint8_t *adc_addr = (void *)(Base_GPIO2);

void init_H_BRIDGEs(void){
//H-bridge motor M1
  (*IOp_hi).pwm_m1_mode1 =0; (*IOp_hi).pwm_m1_mode2 =1;     //parallel full bridge mode ( 0 1 )
  (*IOp_lo).m1_pwm_c=0     ; (*IOp_lo).m1_pwm_d=0;          //c and d not used
  (*IOp_hi).pwm_m1_reset_AB = 1; (*IOp_hi).pwm_m1_reset_CD = 1;  delay_ms(10);
  (*IOp_hi).pwm_m1_reset_AB = 0; (*IOp_hi).pwm_m1_reset_CD = 0;  delay_ms(10);
  (*IOp_hi).pwm_m1_reset_AB = 1; (*IOp_hi).pwm_m1_reset_CD = 1;  delay_ms(10);
//H-bridge motor M2 and M3
  (*IOp_hi).pwm_m2_3_mode1 =0; (*IOp_hi).pwm_m2_3_mode2 =0;     //dual full bridge mode ( 0 0 )
  (*IOp_hi).pwm_m2_reset_AB = 1;  (*IOp_hi).pwm_m3_reset_CD = 1;  delay_ms(10);
  (*IOp_hi).pwm_m2_reset_AB = 0;  (*IOp_hi).pwm_m3_reset_CD = 0;  delay_ms(10);
  (*IOp_hi).pwm_m2_reset_AB = 1;  (*IOp_hi).pwm_m3_reset_CD = 1;  delay_ms(10);
}

// Encoders
int32_t *enc[3];

void init_Encoders(void){
  enc[0] = (int32_t *)Base_WB_ENCODER_1;
  enc[1] = (int32_t *)Base_WB_ENCODER_2;
  enc[2] = (int32_t *)Base_WB_ENCODER_3;
  for(uint8 i=0;i<3;i++)*enc[i]=0;
}

// ADCs
uint16_t *ADC_X_0;
uint16_t *ADC_X_1;
uint16 ADCdata0[8];
uint16 ADCdata1[8];
uint8 adc0_channels[9]= {0,1,2,3,4,5,6,7,0};
uint8 adc1_channels[9]= {0,1,2,3,4,5,6,7,0};
uint32 ADC_cur[3];

void init_ADCs(void){
  ADC_X_0 = (void *)(Base_WB_ADCX);
  ADC_X_1 = (void *)(Base_WB_ADCX + 2);
}

// SPIs
spi_t*                                 spi_ec;

void init_SPIs(void){
  spi_ec = spi_open(DRV_SPI_EC);
  spi_set_endianess( spi_ec, true );
  spi_set_mode( spi_ec, SPI_MODE3 );
  spi_set_baudrate( spi_ec, 10000000 );
}

// PWMs
#define pwm_frequency                  50000
// Hardware prevents 100% - Look at datasheet
//#define pwm_duty_limit                 4000
// Max = 16383, DRV8432-DRV8412 states 20ns off at 10kHz
// 10kHz = 100us, 20ns/100us = 0.0002
// 0.0002 * 16383 = 3.3 < 4
// At 50kHz 20ns is 0.001 so take max =
#define pwm_duty_limit                 16379
pwmx_t*                                pwm_mot[3];
int16                                  pwm_duty[3];

void init_PWMs(void){
  (*IOp_lo).disable_m1=1;
  (*IOp_lo).disable_m2=1;
  pwm_mot[0]=pwmx_open(DRV_PWMX_1);
  pwm_mot[1]=pwmx_open(DRV_PWMX_2);
  pwm_mot[2]=pwmx_open(DRV_PWMX_3);
  for(uint8 i=0;i<3;i++){
    pwmx_set_resolution_mode(pwm_mot[i],PWMX_MODE_10BIT);
//    pwmx_set_resolution_mode(pwm_mot[i],PWMX_MODE_12BIT);
//    pwmx_set_dutycycle(pwm_mot[i],0);
    pwmx_set_pulsewidth(pwm_mot[i],0);
    pwm_duty[i]=0;
    pwmx_set_frequency(pwm_mot[i],pwm_frequency);
    pwmx_enable_controller(pwm_mot[i]);
  }
}

void update_pwm(void){
  int16                                pwm;

  if(Wb.disable_motor_register.all_motors==1){
    clear_pwm();
    return;
  }
  if(Wb.control_register.ramp_off){
    for(uint8 i=0;i<3;i++){
      pwm_duty[i]=htoes(Wb.pwm_motor[i]);
      if(pwm_duty[i]>pwm_duty_limit)pwm_duty[i]=pwm_duty_limit;
      else if(pwm_duty[i]<-pwm_duty_limit)pwm_duty[i]=-pwm_duty_limit;
      pwmx_set_pulsewidth(pwm_mot[i],abs(pwm_duty[i]));
    }
  }else{
    for(uint8 i=0;i<3;i++){
      pwm=htoes(Wb.pwm_motor[i]);
      if(pwm>pwm_duty_limit)pwm=pwm_duty_limit;
      else if(pwm<-pwm_duty_limit)pwm=-pwm_duty_limit;
      if(pwm>pwm_duty[i])pwm_duty[i]++;
      else if(pwm<pwm_duty[i])pwm_duty[i]--;
      pwmx_set_pulsewidth(pwm_mot[i],abs(pwm_duty[i]));
    }
  }
  (*IOp_lo).disable_m1=0;
  (*IOp_lo).disable_m2=0;
  (*IOp_lo).direction_m1=(pwm_duty[0]<0);
  (*IOp_lo).direction_m2=(pwm_duty[1]<0);
  (*IOp_lo).direction_m3=(pwm_duty[2]<0);
}

void clear_pwm(void){
  (*IOp_lo).disable_m1=1;
  (*IOp_lo).disable_m2=1;
  for(uint8 i=0;i<3;i++){
    pwmx_set_dutycycle(pwm_mot[i],0);
    pwm_duty[i]=0;
  }
}

enum e_esra_state{
  E_OK,
  E_POWER_DOWN,
  E_HEARTBEAT_TIMEOUT,
  E_NO_OP_STATE
}                                   esra_state=E_OK;

// Extern used
_ESCvar                             ESCvar;
_MBX                                MBX[MBXBUFFERS];
_MBXcontrol                         MBXcontrol[MBXBUFFERS];
uint8                               MBXrun=0;
uint16                              SM2_sml,SM3_sml;
_Rbuffer                            Rb;
_Wbuffer                            Wb;
_App                                App;
uint16                              TXPDOsize,RXPDOsize;
uint8                               Ec_state;

void ESC_objecthandler(uint16 index, uint8 subindex){
}

void read_ADC(void){
  for (uint8 i=0;i<9;i++){
    *adc_addr=adc0_channels[i]|0x80;            // idle -> wait
    *adc_addr=adc1_channels[i]|0x80;            // idle -> wait
    for(uint8 r=0;r<13;r++)__nop();
    *adc_addr=adc0_channels[i]&0x7F;            // wait -> read
    *adc_addr=adc1_channels[i]&0x7F;            // wait -> read
    if(i!=0){
      switch(i){
      case 1:
        Rb.ADC[0]=htoes(ADCdata0[0]);
//        Rb.ADC[0]=htoes(pwm_duty[0]);
// Check for 5V ADC
        if(ADCdata1[0]<(3071*90/100))Rb.status_register.power5V=0;
        else if(ADCdata1[0]>(3071*110/100))Rb.status_register.power5V=0;
        else Rb.status_register.power5V=1;
        break;
      case 2:
        Rb.ADC[1]=htoes(ADCdata0[1]);
        if(ADCdata1[1]<(2660*83/100))Rb.status_register.power12V=0;
        else if(ADCdata1[1]>(2660*117/100))Rb.status_register.power12V=0;
        else Rb.status_register.power12V=1;
        break;
      case 3:
        Rb.ADC[2]=htoes(ADCdata0[2]);
        if(ADCdata1[2]<(2729*83/100))Rb.status_register.power24V=0;
        else if(ADCdata1[2]>(2729*117/100))Rb.status_register.power24V=0;
        else Rb.status_register.power24V=1;
        break;
      case 4:
      case 5:
      case 6:
        Rb.ADC[i-1]=htoes(ADCdata0[i-1]);
        break;
      case 7:
        if(ADCdata1[6]<(1487*92/100))Rb.status_register.power1V2=0;
        else if(ADCdata1[6]>(1487*108/100))Rb.status_register.power1V2=0;
        else Rb.status_register.power1V2=1;
        break;
      case 8:
        if(ADCdata1[7]<(2046*91/100))Rb.status_register.power1V65=0;
        else if(ADCdata1[7]>(2046*109/100))Rb.status_register.power1V65=0;
        else Rb.status_register.power1V65=1;
        break;
      }
    }
    while((*ADC_X_0&0x8000)==0);
    if(i!=0)ADCdata0[adc0_channels[i-1]]=*ADC_X_0&0x0FFF;
    while((*ADC_X_1&0x8000)==0);
    if(i!=0)ADCdata1[adc1_channels[i-1]]=*ADC_X_1&0x0FFF;
  }
}

void update_flash_led(void){
  static uint16                        c;

  if(c++&0x0400)(*IOp_lo).led=~(*IOp_lo).led;
}

void check_heart_beat(void){
  static uint8                         pre_heart_beat;
  static uint32                        heart_beat_timeout;

  if(Wb.control_register.heart_beat_off){
// Disabled
    if(esra_state==E_HEARTBEAT_TIMEOUT)esra_state=E_OK;
  }else{
// Enabled
    if(pre_heart_beat!=Wb.heart_beat){
// Received hart beat
      pre_heart_beat=Wb.heart_beat;
      heart_beat_timeout=ESCvar.Time;
      if(esra_state==E_HEARTBEAT_TIMEOUT)esra_state=E_OK;
    }else{
      if((ESCvar.Time-heart_beat_timeout)>50000000){
// Timeout for hart beat
        if(esra_state==E_OK){
          esra_state=E_HEARTBEAT_TIMEOUT;
          (*IOp_lo).led=0;
          clear_pwm();
        }
      }
    }
  }
}

void check_power(void){
// Disabled
  if(Wb.control_register.power_off){
    if(esra_state==E_POWER_DOWN)esra_state=E_OK;
// Enabled - Emergency button pressed
  }else if(ADCdata1[2]<0x0500){
// 24V low
    if(esra_state==E_OK){
      esra_state=E_POWER_DOWN;
      (*IOp_lo).led=0;
      clear_pwm();
    }
// 24V OK
  }else if(esra_state==E_POWER_DOWN)esra_state=E_OK;
  Rb.status_register.emergency=1;
}

void check_op_state(void){
  if(ESCvar.ALstatus!=ESCop){
// No op state
    if(esra_state==E_OK){
      esra_state=E_NO_OP_STATE;
      (*IOp_lo).led = 0;
      clear_pwm();
    }
// Op state
  }else if(esra_state==E_NO_OP_STATE)esra_state=E_OK;
}

void DIG_process(void){
  static uint8                         wd_error=0;
  static uint8                         m_idx=0;

  if(Ec_state&APPSTATE_OUTPUT){
    if(ESCvar.ALevent&ESCREG_ALEVENT_SM2) // SM2 trigger ?
      ESC_read(SM2_sma,(uint8*)&Wb,RXPDOsize,(uint8*)&ESCvar.ALevent);
    if(wd_error){
      ESC_stopoutput();
// watchdog, invalid outputs
      ESC_ALerror(ALERR_WATCHDOG);
// goto safe-op with error bit set
      ESC_ALstatus(ESCsafeop|ESCerror);
    }
  }else wd_error=0;
// copy application values to ethercat buffer
  read_ADC();
  check_heart_beat();
  check_power();
  check_op_state();
  if(Ec_state){
    Rb.status_register.state=esra_state;
    Rb.msg_idx=m_idx++;
    for(uint8 i=0;i<3;i++)Rb.enc_position[i]=htoes(*enc[i]);
    ESC_write(SM3_sma,(uint8*)&Rb,TXPDOsize,(uint8*)&ESCvar.ALevent);
  }
}

void update_esra_state(void){
  if(esra_state==E_OK){
    update_flash_led();
    update_pwm();
  }
}

int main(void){
  init_Encoders();
  init_ADCs();
  init_SPIs();
  init_PWMs();
  init_H_BRIDGEs();

  delay_ms(333);
  TXPDOsize = sizeTXPDO();
  RXPDOsize = sizeRXPDO();
  delay_ms(333);
// wait until ESC is started up
  while ((ESCvar.DLstatus & 0x0001) == 0)    {
    ESC_read(ESCREG_DLSTATUS, (uint8*)&ESCvar.DLstatus, sizeof(ESCvar.DLstatus), (uint8*)&ESCvar.ALevent);
    ESCvar.DLstatus = etohs(ESCvar.DLstatus);
    delay_us(10);
  }
  delay_ms(333);
// reset ESC to init state
  ESC_ALstatus(ESCinit);
  ESC_ALerror(ALERR_NONE);
  ESC_stopmbx();
  ESC_stopinput();
  ESC_stopoutput();
  delay_ms(333);
// cyclic application loop
  pwm_duty[0]=0;
  pwm_duty[1]=0;
  pwm_duty[2]=0;
  delay_ms(60);
  for(;;){
// *****  Ethercat arbitration  ******
    ESC_read(ESCREG_LOCALTIME,(uint8*)&ESCvar.Time,sizeof(ESCvar.Time),(uint8*)&ESCvar.ALevent);
    ESCvar.Time=etohl(ESCvar.Time);
    DIG_process();
    if(ESCvar.ALevent)ESC_ALevent();
    ESC_state();
    if(ESC_mbxprocess()){
      ESC_coeprocess();
//      ESC_foeprocess();
    }
// *****  User code  *****
    update_esra_state();
  }
};

