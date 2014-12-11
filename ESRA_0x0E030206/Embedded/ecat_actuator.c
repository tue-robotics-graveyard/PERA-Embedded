/* file: ecat_actuator.c */
#include <stdio.h>
#include <string.h>
#include <swplatform.h>
#include "utypes.h"
#include "esc.h"
#include "esc_foe.h"
#include "version.h"

// Extern used
_ESCvar                             ESCvar;
_MBX                                MBX[MBXBUFFERS];
_MBXcontrol                         MBXcontrol[MBXBUFFERS];
uint8_t                             MBXrun=0;
uint16_t                            SM2_sml,SM3_sml;
miso_packet_t                       miso_packet;
mosi_packet_t                       mosi_packet;
_App                                App;
uint16_t                            TXPDOsize,RXPDOsize;
uint8_t                             Ec_state;

// Local global
uint32_t MOSI_time;

void clear_actuators(void);

union __packed__{
  struct __packed__{
    uint8_t frun:1;              //bit 7
    uint8_t direction_3:1;
    uint8_t direction_2:1;
    uint8_t direction_1:1;
    uint8_t spare_out_4:1;
    uint8_t spare_out_3:1;
    uint8_t enable_2:1;
    uint8_t enable_1:1;          //bit 0
  }               line;
  uint8_t         port;
}*IOp_DO=(void*)(GPIO_1_BASE_ADDRESS+GPIO_1_DO_);

struct __packed__{
  uint8_t res:3;                 //bit 5..7
  uint8_t adc_enable:1;
  uint8_t adc_address:4;         //bit 0
}*IOp_B=(void*)(GPIO_1_BASE_ADDRESS+GPIO_1_ADC);

union __packed__{
  struct __packed__{
    uint8_t res:4;               //bit 4..7
    uint8_t spare_in_4:1;
    uint8_t spare_in_3:1;
    uint8_t spare_in_2:1;
    uint8_t spare_in_1:1;        //bit 0
  }               line;
  uint8_t         port;
}*IOp_DI=(void*)(GPIO_1_BASE_ADDRESS+GPIO_1_DI);

struct __packed__{
  uint8_t res:6;               //bit 2..7
  uint8_t no_op_state:1;
  uint8_t timeout:1;           //bit 0
}status;

// EtherCAT coupler
void init_EC(void){
  spi_set_endianess(drv_ec_1,true);
  spi_cs_hi(drv_ec_1);
}

// ADCs
void init_ADC(void){
  (*IOp_B).adc_enable=1;
}

void read_ADC(void){
  uint16_t ADC;
  int16_t  ADC_current;

  miso_packet.digital_in.line.power_status=1;
  for(uint8_t i=0;i<16;i++){
    (*IOp_B).adc_enable=0;
    (*IOp_B).adc_address=i;
    ADC=((*(uint16_t*)ADC_1_BASE_ADDRESS)>>1)&0x0FFF;
    (*IOp_B).adc_enable=1;
    switch(i){
// No break needed
    case 0:
      miso_packet.force_1=htoes(ADC);
      break;
    case 1:
      miso_packet.pos_1=htoes(ADC);
      break;
    case 2:
      miso_packet.force_2=htoes(ADC);
      break;
    case 3:
      miso_packet.pos_2=htoes(ADC);
      break;
    case 4:
      miso_packet.force_3=htoes(ADC);
      break;
    case 5:
      miso_packet.pos_3=htoes(ADC);
      break;
    case 6:
      if(ADC<(1487*92/100))miso_packet.digital_in.line.power_status=0;
      else if(ADC>(1487*108/100))miso_packet.digital_in.line.power_status=0;
      break;
    case 7:
      if(ADC<(2046*91/100))miso_packet.digital_in.line.power_status=0;
      else if(ADC>(2046*109/100))miso_packet.digital_in.line.power_status=0;
      break;
    case 8:
// Check for 5V ADC
      if(ADC<(3071*90/100))miso_packet.digital_in.line.power_status=0;
      else if(ADC>(3071*110/100))miso_packet.digital_in.line.power_status=0;
      break;
    case 9:
      if(ADC<(2660*83/100))miso_packet.digital_in.line.power_status=0;
      else if(ADC>(2660*117/100))miso_packet.digital_in.line.power_status=0;
      break;
    case 10:
      if(ADC<(2729*83/100))miso_packet.digital_in.line.power_status=0;
      else if(ADC>(2729*117/100))miso_packet.digital_in.line.power_status=0;
      break;
    case 11:
      ADC_current=ADC;
      ADC_current-=2048;
      ADC_current*=2;
      miso_packet.current_1=htoes(ADC_current);
      break;
    case 12:
      ADC_current=ADC;
      ADC_current-=2048;
      miso_packet.current_2=htoes(ADC_current);
      break;
    case 13:
      ADC_current=ADC;
      ADC_current-=2048;
      miso_packet.current_3=htoes(ADC_current);
      break;
    case 14:
      miso_packet.spare_ai_1=htoes(ADC);
      break;
    case 15:
      miso_packet.spare_ai_2=htoes(ADC);
      break;
    }
  }
}

// PWMs
#define pwm_duty_limit                 1000

void init_PWM(void){
  pwmx_enable_controller(drv_pwm_1);
  pwmx_enable_controller(drv_pwm_2);
  pwmx_enable_controller(drv_pwm_3);
}

void update_PWM(void){
  int16_t                              pwm;

  pwm=htoes(mosi_packet.m_1);
  if(pwm>pwm_duty_limit)pwm=pwm_duty_limit;
  else if(pwm<-pwm_duty_limit)pwm=-pwm_duty_limit;
  pwmx_set_pulsewidth(drv_pwm_1,abs(pwm));
  (*IOp_DO).line.direction_1=(pwm<0);
  pwm=htoes(mosi_packet.m_2);
  if(pwm>pwm_duty_limit)pwm=pwm_duty_limit;
  else if(pwm<-pwm_duty_limit)pwm=-pwm_duty_limit;
  pwmx_set_pulsewidth(drv_pwm_2,abs(pwm));
  (*IOp_DO).line.direction_2=(pwm<0);
  pwm=htoes(mosi_packet.m_3);
  if(pwm>pwm_duty_limit)pwm=pwm_duty_limit;
  else if(pwm<-pwm_duty_limit)pwm=-pwm_duty_limit;
  pwmx_set_pulsewidth(drv_pwm_3,abs(pwm));
  (*IOp_DO).line.direction_3=(pwm<0);
}

void clear_PWM(void){
  pwmx_set_pulsewidth(drv_pwm_1,0);
  pwmx_set_pulsewidth(drv_pwm_2,0);
  pwmx_set_pulsewidth(drv_pwm_3,0);
}

// Encoders
void read_Encoders(void){
  uint16_t                             encoder;

  encoder=*(int16_t*)ENC_1_BASE_ADDRESS;
  miso_packet.encoder_1=htoes(encoder);
  encoder=*(int16_t*)ENC_2_BASE_ADDRESS;
  miso_packet.encoder_2=htoes(encoder);
  encoder=*(int16_t*)ENC_3_BASE_ADDRESS;
  miso_packet.encoder_3=htoes(encoder);
}

// DAC
void write_DAC(uint8_t reg,uint16_t data){
  spi_cs_lo(drv_dac_1);
  spi_transceive8(drv_dac_1,reg);
  spi_transceive16(drv_dac_1,data);
  spi_cs_hi(drv_dac_1);
}

void init_DAC(void){
  spi_set_endianess(drv_dac_1,true);
  spi_cs_hi(drv_dac_1);
// Output range = +10V
  write_DAC(0x0C,0x0001);
// Power
  write_DAC(0x10,0x0015);
// Control
  write_DAC(0x19,0x0006);
  write_DAC(0x00,0x8000);
  write_DAC(0x02,0x8000);
}

void clear_DAC(void){
  write_DAC(0x00,0x8000);
  write_DAC(0x02,0x8000);
}

void update_DAC(void){
  write_DAC(0x00,(2048+htoes(mosi_packet.aout_1))<<4);
  write_DAC(0x02,(2048+htoes(mosi_packet.aout_2))<<4);
}

void ESC_objecthandler(uint16_t index, uint8_t subindex){
}

void update_flash_led(void){
  static uint16_t                        c;

  if(c++&0x2000){
    c=0;
    (*IOp_DO).line.frun=~(*IOp_DO).line.frun;
  }
}

void check_timeout(void){
// No timeout set
  if(status.timeout==0){
    if((ESCvar.Time-MOSI_time)>50000000){
      clear_actuators();
      status.timeout=1;
    }
  }
}

void init_actuators(void){
  (*IOp_DO).port=0;
  init_PWM();
// V3 board
  init_DAC();
}

void clear_actuators(void){
  (*IOp_DO).port=0;
  clear_PWM();
// V3 board
  clear_DAC();
}

void update_actuators(void){
  (*IOp_DO).port=((*IOp_DO).port&0xF0)|(mosi_packet.digital_out.port&0x0F);
  update_PWM();
// V3 board
  update_DAC();
}

void init_sensors(void){
  init_ADC();
}

void check_op_state(void){
  if(ESCvar.ALstatus!=ESCop){
// No op state
    if(status.no_op_state==0){
      clear_actuators();
      status.no_op_state=1;
    }
// Op state
  }else status.no_op_state=0;
}

void read_MOSI(void){
  if((Ec_state&APPSTATE_OUTPUT)&&(ESCvar.ALevent&ESCREG_ALEVENT_SM2)){
    ESC_read(SM2_sma,(uint8_t*)&mosi_packet,RXPDOsize,(uint8_t*)&ESCvar.ALevent);
    if(status.no_op_state==0)update_actuators();
    status.timeout=0;
    MOSI_time=ESCvar.Time;
  }
}

void write_MISO(void){
  uint16_t                              t;

  if(Ec_state&APPSTATE_INPUT){
    read_Encoders();
    if(ESCvar.Time&0x80)t=1+(uint16_t)(ESCvar.Time>>8);
    else t=(uint16_t)(ESCvar.Time>>8);
    miso_packet.timestamp=htoes(t);
    read_ADC();
    miso_packet.digital_in.port=(*IOp_DI).port;
    ESC_write(SM3_sma,(uint8_t*)&miso_packet,TXPDOsize,(uint8_t*)&ESCvar.ALevent);
  }
}

int32_t main(void){
  swplatform_init_stacks();
  init_EC();
  init_actuators();
  init_sensors();
  status.timeout=1;
  delay_ms(333);
  TXPDOsize = sizeTXPDO();
  RXPDOsize = sizeRXPDO();
  delay_ms(333);
// wait until ESC is started up
  while ((ESCvar.DLstatus & 0x0001) == 0)    {
    ESC_read(ESCREG_DLSTATUS, (uint8_t*)&ESCvar.DLstatus, sizeof(ESCvar.DLstatus), (uint8_t*)&ESCvar.ALevent);
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
  delay_ms(60);
  for(;;){
// *****  Ethercat arbitration  ******
    ESC_read(ESCREG_LOCALTIME,(uint8_t*)&ESCvar.Time,sizeof(ESCvar.Time),(uint8_t*)&ESCvar.ALevent);
    ESCvar.Time=etohl(ESCvar.Time);
    if(ESCvar.ALevent)ESC_ALevent();
    ESC_state();
    if(ESC_mbxprocess()){
      ESC_coeprocess();
      ESC_foeprocess();
    }
// *****  User code  *****
    read_MOSI();
    write_MISO();
    check_timeout();
    check_op_state();
    update_flash_led();
  }
}


