/*
 *	Software Platform Generated File
 *	--------------------------------
 */

#ifndef _SWP_DRV_PWMX_CFG_INSTANCE_H
#define _SWP_DRV_PWMX_CFG_INSTANCE_H

#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stddef.h>

#include "per_pwmx_cfg_instance.h"

#include "drv_pwmx_cfg.h"

#define DRV_PWMX_RESOLUTION_8BIT		0
#define DRV_PWMX_RESOLUTION_10BIT		1
#define DRV_PWMX_RESOLUTION_12BIT		2
#define DRV_PWMX_RESOLUTION_14BIT		3

#define DRV_PWMX_INSTANCE_RESOLUTION_8BIT_USED		0
#define DRV_PWMX_INSTANCE_RESOLUTION_10BIT_USED		3
#define DRV_PWMX_INSTANCE_RESOLUTION_12BIT_USED		0
#define DRV_PWMX_INSTANCE_RESOLUTION_14BIT_USED		0
#define DRV_PWMX_INSTANCE_RESOLUTION_OPTIONS_USED		1
#define DRV_PWMX_INSTANCE_RESOLUTION_MIN		DRV_PWMX_RESOLUTION_10BIT
#define DRV_PWMX_INSTANCE_RESOLUTION_MAX		DRV_PWMX_RESOLUTION_10BIT

#define DRV_PWMX_INSTANCE_DUTYCYCLE_MAX		0
#define DRV_PWMX_INSTANCE_DUTYCYCLE_MIN		0

#define DRV_PWMX_INSTANCE_FREQUENCY_MAX		50000
#define DRV_PWMX_INSTANCE_FREQUENCY_MIN		50000

typedef struct
{
	uint8_t    		resolution;
	uint8_t    		dutycycle;
	uint32_t   		frequency;
	int        		per_pwmx;
} drv_pwmx_cfg_instance_t;

extern const drv_pwmx_cfg_instance_t	drv_pwmx_instance_table[];

#endif
