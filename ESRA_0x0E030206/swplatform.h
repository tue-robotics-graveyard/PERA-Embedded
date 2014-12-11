/*
 *	Software Platform Generated File
 *	--------------------------------
 */

#ifndef _SWP_SWPLATFORM_H
#define _SWP_SWPLATFORM_H

/* Device ID's */
#include "devices.h"

/* Extra project headers */
#include "ioport.h"
#include "wb_interfaces.h"

/* Software Services */
#include <interrupts.h>
#include <timers.h>
#include <timing.h>

/* Top Level Stack Items */
#include <drv_m25px0.h>
#include <drv_pwmx.h>
#include <drv_spi.h>
#include <drv_uart8.h>
#include <per_ioport.h>
#include <per_wb_interface.h>

/* Lower Level Stack Items */
#include <per_pwmx.h>
#include <per_spi.h>
#include <per_uart8.h>

/* Global variables to access Software Platform stacks */
extern spi_t *    drv_ec_1;
extern spi_t *    drv_dac_1;
extern uart8_t *  drv_uart_1;
extern pwmx_t *   drv_pwm_1;
extern pwmx_t *   drv_pwm_2;
extern pwmx_t *   drv_pwm_3;
extern m25px0_t * drv_m25px0_1;

/* Initialize all stacks in the Software Platform */
extern void swplatform_init_stacks(void);
#endif
