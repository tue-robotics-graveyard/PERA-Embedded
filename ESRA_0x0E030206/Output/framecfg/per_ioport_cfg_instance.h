/*
 *	Software Platform Generated File
 *	--------------------------------
 */

#ifndef _SWP_PER_IOPORT_CFG_INSTANCE_H
#define _SWP_PER_IOPORT_CFG_INSTANCE_H

#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stddef.h>

#include "per_ioport_cfg.h"

#define PER_IOPORT_BUSWIDTH_8		0
#define PER_IOPORT_BUSWIDTH_16		1
#define PER_IOPORT_BUSWIDTH_32		2

#define PER_IOPORT_INSTANCE_BASEADDRESS_MAX		0xFF0C0000
#define PER_IOPORT_INSTANCE_BASEADDRESS_MIN		0xFF0C0000

#define PER_IOPORT_INSTANCE_BUSWIDTH_8_USED		1
#define PER_IOPORT_INSTANCE_BUSWIDTH_16_USED		0
#define PER_IOPORT_INSTANCE_BUSWIDTH_32_USED		0
#define PER_IOPORT_INSTANCE_BUSWIDTH_OPTIONS_USED		1
#define PER_IOPORT_INSTANCE_BUSWIDTH_MIN		PER_IOPORT_BUSWIDTH_8
#define PER_IOPORT_INSTANCE_BUSWIDTH_MAX		PER_IOPORT_BUSWIDTH_8

#define PER_IOPORT_INSTANCE_PORTCOUNT_MAX		3
#define PER_IOPORT_INSTANCE_PORTCOUNT_MIN		3

typedef struct
{
	uint32_t   		baseaddress;
	int32_t    		buswidth;
	uint8_t    		portcount;
} per_ioport_cfg_instance_t;

extern const per_ioport_cfg_instance_t	per_ioport_instance_table[];

#endif
