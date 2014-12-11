/*
 *	Software Platform Generated File
 *	--------------------------------
 */


#include "swplatform.h"

/* Global variables to access Software Platform stacks */
spi_t *    drv_ec_1;
spi_t *    drv_dac_1;
uart8_t *  drv_uart_1;
pwmx_t *   drv_pwm_1;
pwmx_t *   drv_pwm_2;
pwmx_t *   drv_pwm_3;
m25px0_t * drv_m25px0_1;

/* Initialize all stacks in the Software Platform */
void swplatform_init_stacks(void)
{
    drv_ec_1     = spi_open(DRV_EC_1);
    drv_dac_1    = spi_open(DRV_DAC_1);
    drv_uart_1   = uart8_open(DRV_UART_1);
    drv_pwm_1    = pwmx_open(DRV_PWM_1);
    drv_pwm_2    = pwmx_open(DRV_PWM_2);
    drv_pwm_3    = pwmx_open(DRV_PWM_3);
    drv_m25px0_1 = m25px0_open(DRV_M25PX0_1);
}
