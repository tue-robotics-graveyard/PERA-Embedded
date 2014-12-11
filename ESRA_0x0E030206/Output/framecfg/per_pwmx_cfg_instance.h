/*
 *	Software Platform Generated File
 *	--------------------------------
 */

#ifndef _SWP_PER_PWMX_CFG_INSTANCE_H
#define _SWP_PER_PWMX_CFG_INSTANCE_H

#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stddef.h>

#include "per_pwmx_cfg.h"

#define PER_PWMX_INSTANCE_BASEADDRESS_MAX		0xFF090000
#define PER_PWMX_INSTANCE_BASEADDRESS_MIN		0xFF070000

typedef struct
{
	uint32_t   		baseaddress;
	int8_t     		interrupt;
} per_pwmx_cfg_instance_t;

extern const per_pwmx_cfg_instance_t	per_pwmx_instance_table[];

#endif
