/*
 *	Software Platform Generated File
 *	--------------------------------
 */

#ifndef _SWP_PER_UART8_CFG_INSTANCE_H
#define _SWP_PER_UART8_CFG_INSTANCE_H

#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stddef.h>

#include "per_uart8_cfg.h"

#define PER_UART8_INSTANCE_BASEADDRESS_MAX		0xFF020000
#define PER_UART8_INSTANCE_BASEADDRESS_MIN		0xFF020000

typedef struct
{
	uint32_t   		baseaddress;
	int8_t     		tx_interrupt;
	int8_t     		rx_interrupt;
} per_uart8_cfg_instance_t;

extern const per_uart8_cfg_instance_t	per_uart8_instance_table[];

#endif
