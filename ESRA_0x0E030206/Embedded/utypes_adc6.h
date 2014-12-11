/*
 * SOES Simple Open EtherCAT Slave
 *
 * File    : utype.h
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
#define uint8     unsigned char
#define int8      signed char
#define uint16    unsigned short
#define int16     signed short
#define uint32    unsigned int
#define int32     signed int
#define float32   float

#ifndef __packed__
   #define __packed__                  __attribute__((__packed__))
#endif
#ifndef EC_BIG_ENDIAN
   #define EC_BIG_ENDIAN
#endif
/*
#ifndef EC_LITTLE_ENDIAN
   #define EC_LITTLE_ENDIAN
#endif
*/

typedef union __packed__
  {
    uint16 w;
    uint8 b[2];
  } uint16union;

typedef union __packed__
{
    float32 number;
    uint8 b[4];
} float32union;

#define APPSTATE_IDLE       0x00
#define APPSTATE_INPUT      0x01
#define APPSTATE_OUTPUT     0x02

typedef struct __packed__{
  struct __packed__{
    uint8 emergency:1;                 // bit 7
    uint8 power1V65:1;
    uint8 power1V2:1;
    uint8 power24V:1;
    uint8 power12V:1;
    uint8 power5V:1;
    uint8 state:2;
  }                                    status_register;
  uint16                               enc_position[3];
  uint16                               ADC[6];
  uint8                                msg_idx;
}_Rbuffer;

typedef struct  __packed__{
  int16                                pwm_motor[3];
  struct __packed__{
    uint8 res:5;                       // bit 3..7
    uint8 ramp_off:1;
    uint8 power_off:1;
    uint8 heart_beat_off:1;            // bit 0
  }                                    control_register;
  uint8                                heart_beat;
  struct __packed__{
    uint8 res:2;                       // bit 6..7
    uint8 dac_2_motor:1;
    uint8 dac_1_motor:1;
    uint8 pwm_3_motor:1;
    uint8 pwm_2_motor:1;
    uint8 pwm_1_motor:1;
    uint8 all_motors:1;                // bit 0
  }                                    disable_motor_register;
}_Wbuffer;

typedef struct{
  uint8                                state; // internal, don't change!!!!
}_App;

extern _Rbuffer        Rb, Rb_Tx;
extern _Wbuffer        Wb, Wb_Rx;
extern _App            App;
extern uint8           Ec_state;

#if !defined(EC_BIG_ENDIAN) && defined(EC_LITTLE_ENDIAN)

  #define htoes(A) (A)
  #define htoel(A) (A)
  #define htoell(A) (A)
  #define etohs(A) (A)
  #define etohl(A) (A)
  #define etohll(A) (A)

#elif !defined(EC_LITTLE_ENDIAN) && defined(EC_BIG_ENDIAN)

  #define htoes(A) ((((uint16)(A) & 0xff00) >> 8) | \
                    (((uint16)(A) & 0x00ff) << 8))
  #define htoel(A) ((((uint32)(A) & 0xff000000) >> 24) | \
                    (((uint32)(A) & 0x00ff0000) >> 8)  | \
                    (((uint32)(A) & 0x0000ff00) << 8)  | \
                    (((uint32)(A) & 0x000000ff) << 24))
  #define htoell(A) ((((uint64)(A) & (uint64)0xff00000000000000ULL) >> 56) | \
                     (((uint64)(A) & (uint64)0x00ff000000000000ULL) >> 40) | \
                     (((uint64)(A) & (uint64)0x0000ff0000000000ULL) >> 24) | \
                     (((uint64)(A) & (uint64)0x000000ff00000000ULL) >> 8)  | \
                     (((uint64)(A) & (uint64)0x00000000ff000000ULL) << 8)  | \
                     (((uint64)(A) & (uint64)0x0000000000ff0000ULL) << 24) | \
                     (((uint64)(A) & (uint64)0x000000000000ff00ULL) << 40) | \
                     (((uint64)(A) & (uint64)0x00000000000000ffULL) << 56))

  #define etohs  htoes
  #define etohl  htoel
  #define etohll htoell

#else

  #error "Must define one of EC_BIG_ENDIAN or EC_LITTLE_ENDIAN"

#endif
