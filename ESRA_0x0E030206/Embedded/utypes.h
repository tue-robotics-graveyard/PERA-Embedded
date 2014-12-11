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

/*
#define uint8     unsigned char
#define int8      signed char
#define uint16    unsigned short
#define int16     signed short
#define uint32    unsigned int
#define int32     signed int
*/
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
    uint16_t w;
    uint8_t  b[2];
  } uint16union_t;

typedef union __packed__
{
    float32 number;
    uint8_t b[4];
} float32union_t;

#define APPSTATE_IDLE       0x00
#define APPSTATE_INPUT      0x01
#define APPSTATE_OUTPUT     0x02

typedef union __packed__{
  struct __packed__{
    uint8_t       power_status:1;           // bit 7
    uint8_t       reserved_3:1;
    uint8_t       reserved_2:1;
    uint8_t       reserved_1:1;
    uint8_t       spare_di_4:1;
    uint8_t       spare_di_3:1;
    uint8_t       spare_di_2:1;
    uint8_t       spare_di_1:1;             // bit 0
  }               line;
  uint8_t         port;
}digital_in_t;

typedef struct __packed__{
  digital_in_t  digital_in;
  uint16_t      encoder_1;
  uint16_t      encoder_2;
  uint16_t      encoder_3;
  int16_t       current_1;
  int16_t       current_2;
  int16_t       current_3;
  uint16_t      calipher_1;
  uint16_t      calipher_2;
  uint16_t      force_1;
  uint16_t      force_2;
  uint16_t      force_3;
  uint16_t      pos_1;
  uint16_t      pos_2;
  uint16_t      pos_3;
  uint16_t      spare_ai_1;
  uint16_t      spare_ai_2;
  uint16_t      timestamp;
}miso_packet_t;

typedef union __packed__{
  struct __packed__{
    uint8_t       reserved_4:1;        // bit 7
    uint8_t       reserved_3:1;
    uint8_t       reserved_2:1;
    uint8_t       reserved_1:1;
    uint8_t       spare_do_4:1;
    uint8_t       spare_do_3:1;
    uint8_t       enable_2:1;
    uint8_t       enable_1:1;               // bit 0
  }               line;
  uint8_t         port;
}digital_out_t;

typedef struct __packed__{
  digital_out_t digital_out;
  int16_t       m_1;
  int16_t       m_2;
  int16_t       m_3;
  int16_t       aout_1;
  int16_t       aout_2;
}mosi_packet_t;

typedef struct{
  uint8_t                              state; // internal, don't change!!!!
}_App;

extern miso_packet_t   miso_packet;
extern mosi_packet_t   mosi_packet;
extern _App            App;
extern uint8_t         Ec_state;

#if !defined(EC_BIG_ENDIAN) && defined(EC_LITTLE_ENDIAN)

  #define htoes(A) (A)
  #define htoel(A) (A)
  #define htoell(A) (A)
  #define etohs(A) (A)
  #define etohl(A) (A)
  #define etohll(A) (A)

#elif !defined(EC_LITTLE_ENDIAN) && defined(EC_BIG_ENDIAN)

  #define htoes(A) ((((uint16_t)(A) & 0xff00) >> 8) | \
                    (((uint16_t)(A) & 0x00ff) << 8))
  #define htoel(A) ((((uint32_t)(A) & 0xff000000) >> 24) | \
                    (((uint32_t)(A) & 0x00ff0000) >> 8)  | \
                    (((uint32_t)(A) & 0x0000ff00) << 8)  | \
                    (((uint32_t)(A) & 0x000000ff) << 24))
  #define htoell(A) ((((uint64_t)(A) & (uint64_t)0xff00000000000000ULL) >> 56) | \
                     (((uint64_t)(A) & (uint64_t)0x00ff000000000000ULL) >> 40) | \
                     (((uint64_t)(A) & (uint64_t)0x0000ff0000000000ULL) >> 24) | \
                     (((uint64_t)(A) & (uint64_t)0x000000ff00000000ULL) >> 8)  | \
                     (((uint64_t)(A) & (uint64_t)0x00000000ff000000ULL) << 8)  | \
                     (((uint64_t)(A) & (uint64_t)0x0000000000ff0000ULL) << 24) | \
                     (((uint64_t)(A) & (uint64_t)0x000000000000ff00ULL) << 40) | \
                     (((uint64_t)(A) & (uint64_t)0x00000000000000ffULL) << 56))

  #define etohs  htoes
  #define etohl  htoel
  #define etohll htoell

#else

  #error "Must define one of EC_BIG_ENDIAN or EC_LITTLE_ENDIAN"

#endif
