/*
 * SOES Simple Open EtherCAT Slave
 *
 * File    : esc_hw.c
 * Version : 0.9.2
 * Date    : 22-02-2010
 * Copyright (C) 2007-2010 Arthur Ketels
 *
 * SOES is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License version 2 as published by the Free
 * Software Foundation.
 *
 * SOES is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * for more details.
 *
 * As a special exception, if other files instantiate templates or use macros
 * or inline functions from this file, or you compile this file and link it
 * with other works to produce a work based on this file, this file does not
 * by itself cause the resulting work to be covered by the GNU General Public
 * License. However the source code for this file must still be made available
 * in accordance with section (3) of the GNU General Public License.
 *
 * This exception does not invalidate any other reasons why a work based on
 * this file might be covered by the GNU General Public License.
 *
 * The EtherCAT Technology, the trade name and logo "EtherCAT" are the intellectual
 * property of, and protected by Beckhoff Automation GmbH.
 */
#include <swplatform.h>
#include "utypes.h"

#ifndef SPIF
#define SPIF 7
#endif

#define ESC_CMD_READ    0x02
#define ESC_CMD_READWS  0x03
#define ESC_CMD_WRITE   0x04
#define ESC_CMD_NOP     0x00
#define ESC_TERM        0xff
#define ESC_NEXT        0x00

void ESC_read(uint16_t address,uint8_t *buf,uint16_t len,uint8_t *tALevent)
{
  uint16_t      count;
  uint8_t       *ptr;
  uint16union_t adr;

  spi_cs_lo(drv_ec_1);          //assert SPI
  adr.w = address << 3;
  ptr = tALevent;
  *(ptr+1) = spi_transceive8(drv_ec_1, adr.b[0]);
  count = len;
  *(ptr)   = spi_transceive8(drv_ec_1, adr.b[1] | ESC_CMD_READ);
  ptr = buf;
  while (--count > 0)
    *(ptr++) = spi_transceive8(drv_ec_1, ESC_NEXT);
  *(ptr) = spi_transceive8(drv_ec_1, ESC_TERM);
  spi_cs_hi(drv_ec_1);  //release SPI
}

void ESC_write(uint16_t address, uint8_t *buf, uint16_t len, uint8_t *tALevent)
{
  uint16_t      count;
  uint8_t       *ptr;
  uint16union_t adr;

  spi_cs_lo(drv_ec_1);       //assert SPI
  ptr = tALevent;
  adr.w = address << 3;
  *(ptr+1) = (uint8_t)(spi_transceive8(drv_ec_1, adr.b[0]));
  count = len;
  *(ptr  ) = (uint8_t)(spi_transceive8(drv_ec_1, adr.b[1] | ESC_CMD_WRITE));
  ptr = buf;
  while (count-- > 0)
    spi_transceive8(drv_ec_1, *(ptr++));
  spi_cs_hi(drv_ec_1);     //release SPI
}


