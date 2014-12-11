/*
 *	Software Platform Generated File
 *	--------------------------------
 */

#ifndef _SWP_DRV_SPI_CFG_INSTANCE_H
#define _SWP_DRV_SPI_CFG_INSTANCE_H

#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stddef.h>

#include "per_spi_cfg_instance.h"

#include "drv_spi_cfg.h"

#define DRV_SPI_SPIMODE_MODE0		0
#define DRV_SPI_SPIMODE_MODE1		1
#define DRV_SPI_SPIMODE_MODE2		2
#define DRV_SPI_SPIMODE_MODE3		3

#define DRV_SPI_WAIT_MODE_NOP		0
#define DRV_SPI_WAIT_MODE_YIELD		1
#define DRV_SPI_WAIT_MODE_SLEEP		2

#define DRV_SPI_INSTANCE_SPIMODE_MODE0_USED		0
#define DRV_SPI_INSTANCE_SPIMODE_MODE1_USED		1
#define DRV_SPI_INSTANCE_SPIMODE_MODE2_USED		0
#define DRV_SPI_INSTANCE_SPIMODE_MODE3_USED		2
#define DRV_SPI_INSTANCE_SPIMODE_OPTIONS_USED		2
#define DRV_SPI_INSTANCE_SPIMODE_MIN		DRV_SPI_SPIMODE_MODE1
#define DRV_SPI_INSTANCE_SPIMODE_MAX		DRV_SPI_SPIMODE_MODE3

#define DRV_SPI_INSTANCE_SPI_FREQUENCY_MAX		20000000
#define DRV_SPI_INSTANCE_SPI_FREQUENCY_MIN		10000000

#define DRV_SPI_INSTANCE_NB_MULTIPLEX_SUPPORT_TRUE_USED		0
#define DRV_SPI_INSTANCE_NB_MULTIPLEX_SUPPORT_FALSE_USED		3
#define DRV_SPI_INSTANCE_NB_MULTIPLEX_SUPPORT_OPTIONS_USED		1

#define DRV_SPI_INSTANCE_CHANNELS_MAX		0
#define DRV_SPI_INSTANCE_CHANNELS_MIN		0

typedef struct
{
	int32_t    		spimode;
	uint32_t   		spi_frequency;
	bool       		nb_multiplex_support;
	uint8_t    		channels;
	int        		per_spi;
} drv_spi_cfg_instance_t;

extern const drv_spi_cfg_instance_t	drv_spi_instance_table[];

#endif
