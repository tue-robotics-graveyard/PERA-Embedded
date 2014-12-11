/*
 *	Software Platform Generated File
 *	--------------------------------
 */

#ifndef _SWP_DRV_M25PX0_CFG_INSTANCE_H
#define _SWP_DRV_M25PX0_CFG_INSTANCE_H

#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stddef.h>

#include "drv_spi_cfg_instance.h"

#include "drv_m25px0_cfg.h"

#define DRV_M25PX0_SPI_MODE_MODE0		SPI_MODE0
#define DRV_M25PX0_SPI_MODE_MODE1		SPI_MODE1
#define DRV_M25PX0_SPI_MODE_MODE2		SPI_MODE2
#define DRV_M25PX0_SPI_MODE_MODE3		SPI_MODE3

#define DRV_M25PX0_BLOCKING_MODE_NOP		0
#define DRV_M25PX0_BLOCKING_MODE_NANOSLEEP		1
#define DRV_M25PX0_BLOCKING_MODE_YIELD		2

#define DRV_M25PX0_INSTANCE_SPI_MODE_MODE0_USED		0
#define DRV_M25PX0_INSTANCE_SPI_MODE_MODE1_USED		0
#define DRV_M25PX0_INSTANCE_SPI_MODE_MODE2_USED		0
#define DRV_M25PX0_INSTANCE_SPI_MODE_MODE3_USED		1
#define DRV_M25PX0_INSTANCE_SPI_MODE_OPTIONS_USED		1
#define DRV_M25PX0_INSTANCE_SPI_MODE_MIN		DRV_M25PX0_SPI_MODE_MODE3
#define DRV_M25PX0_INSTANCE_SPI_MODE_MAX		DRV_M25PX0_SPI_MODE_MODE3

#define DRV_M25PX0_INSTANCE_SPI_FREQ_MAX		1000000
#define DRV_M25PX0_INSTANCE_SPI_FREQ_MIN		1000000

#define DRV_M25PX0_INSTANCE_BUS_SHARING_TRUE_USED		1
#define DRV_M25PX0_INSTANCE_BUS_SHARING_FALSE_USED		0
#define DRV_M25PX0_INSTANCE_BUS_SHARING_OPTIONS_USED		1

#define DRV_M25PX0_INSTANCE_CHANNEL_MAX		2
#define DRV_M25PX0_INSTANCE_CHANNEL_MIN		2

#define DRV_M25PX0_INSTANCE_TOTALSIZE_KB_MAX		8192
#define DRV_M25PX0_INSTANCE_TOTALSIZE_KB_MIN		8192

#define DRV_M25PX0_INSTANCE_PAGESIZE_KB_MAX		64
#define DRV_M25PX0_INSTANCE_PAGESIZE_KB_MIN		64

typedef struct
{
	int32_t    		spi_mode;
	uint32_t   		spi_freq;
	bool       		bus_sharing;
	uint8_t    		channel;
	uint32_t   		totalsize_kb;
	uint32_t   		pagesize_kb;
	int        		drv_spi;
} drv_m25px0_cfg_instance_t;

extern const drv_m25px0_cfg_instance_t	drv_m25px0_instance_table[];

#endif
