/*
 *	Software Platform Generated File
 *	--------------------------------
 */

#ifndef _SWP_PER_WB_INTERFACE_CFG_INSTANCE_H
#define _SWP_PER_WB_INTERFACE_CFG_INSTANCE_H

#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stddef.h>

#include "per_wb_interface_cfg.h"

#define PER_WB_INTERFACE_INSTANCE_BASEADDRESS_MAX		0xFF060000
#define PER_WB_INTERFACE_INSTANCE_BASEADDRESS_MIN		0xFF000000

typedef struct
{
	uint32_t   		baseaddress;
} per_wb_interface_cfg_instance_t;

extern const per_wb_interface_cfg_instance_t	per_wb_interface_instance_table[];

#endif
