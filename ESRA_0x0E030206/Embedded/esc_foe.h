/*
 * SOES Simple Open EtherCAT Slave
 *
 * File    : esc_foe.h
 * Version : 0.1
 * Date    : 11-30-2010
 * Copyright (C) 2010 ZBE Inc.
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

/* FoE handling. */

#ifndef __esc_foe__
#define __esc_foe__

//Maximum number of characters allowed in a file name.
#define FOE_FN_MAX      16
// 4MB


//define the block and page size of the connected SPI flash
//see chip datasheet for more info

// 128Mbit 25p128 (used on Atlys development board)
// 64 sectors of 1024 blocks of 256 bytes each

//#define  FOE_MAXDATA     0x1000000       // 128MBit = 16777216 Bytes
//#define  PAGESPERBLOCK   1024
//#define  PAGESIZE        256

// 8Mbit 25p80 (used on Debloflex PCBs)
// 16 sectors of 256 blocks of 256 bytes each

//#define  FOE_MAXDATA     0x100000       // 8 MBit = 1048576 Bytes
#define  FOE_MAXDATA     0x400000       // 32 MBit = 4M Bytes
#define  PAGESPERBLOCK   256
#define  FOE_PAGESIZE    256


#define FOE_IDLE 0
#define FOE_READ 1
#define FOE_WRITE 2

/* Initializes FoE state. */
void FOE_init(void);
void ESC_foeprocess(void);

#endif
