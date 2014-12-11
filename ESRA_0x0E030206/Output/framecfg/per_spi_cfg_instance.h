/*
 *	Software Platform Generated File
 *	--------------------------------
 */

#ifndef _SWP_PER_SPI_CFG_INSTANCE_H
#define _SWP_PER_SPI_CFG_INSTANCE_H

#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stddef.h>

#include "per_spi_cfg.h"

#define PER_SPI_INSTANCE_BASEADDRESS_MAX		0xFF0A0000
#define PER_SPI_INSTANCE_BASEADDRESS_MIN		0xFF010000

#define PER_SPI_INSTANCE_TRANSFERSIZE_MAX		8
#define PER_SPI_INSTANCE_TRANSFERSIZE_MIN		8

#define PER_SPI_INSTANCE_SLAVECOUNT_MAX		0
#define PER_SPI_INSTANCE_SLAVECOUNT_MIN		0

#define PER_SPI_INSTANCE_MODEPINENABLED_TRUE_USED		0
#define PER_SPI_INSTANCE_MODEPINENABLED_FALSE_USED		3
#define PER_SPI_INSTANCE_MODEPINENABLED_OPTIONS_USED		1

#define PER_SPI_INSTANCE_OPTION_ISNANOBOARD_TRUE_USED		0
#define PER_SPI_INSTANCE_OPTION_ISNANOBOARD_FALSE_USED		3
#define PER_SPI_INSTANCE_OPTION_ISNANOBOARD_OPTIONS_USED		1

typedef struct
{
	uint32_t   		baseaddress;
	uint32_t   		transfersize;
	uint32_t   		slavecount;
	bool       		modepinenabled;
	bool       		option_isnanoboard;
} per_spi_cfg_instance_t;

extern const per_spi_cfg_instance_t	per_spi_instance_table[];

#endif
