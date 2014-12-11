/*
 * SOES Simple Open EtherCAT Slave
 *
 * File    : objectlist.h
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
#ifndef __objectlist__
#define __objectlist__

#include "version.h"

typedef struct
  {
    uint16_t        subindex;          //subindex
    uint16_t        datatype;          //datatype
    uint16_t        bitlength;
    uint16_t        access;
    char          *name;
    uint32_t        value;
    void          *data;
  } _objd;

typedef struct
  {
    uint16_t        index;
    uint16_t        objtype;
    uint8_t         maxsub;
    uint8_t         pad1;
    char          *name;
    _objd         *objdesc;
  } _objectlist;

#define OBJH_READ               0
#define OBJH_WRITE              1

#define _ac char
#define nil 0

#define OTYPE_DOMAIN            0x0002
#define OTYPE_DEFTYPE           0x0005
#define OTYPE_DEFSTRUCT         0x0006
#define OTYPE_VAR               0x0007
#define OTYPE_ARRAY             0x0008
#define OTYPE_RECORD            0x0009

#define DTYPE_BOOLEAN           0x0001
#define DTYPE_INTEGER8          0x0002
#define DTYPE_INTEGER16         0x0003
#define DTYPE_INTEGER32         0x0004
#define DTYPE_UNSIGNED8         0x0005
#define DTYPE_UNSIGNED16        0x0006
#define DTYPE_UNSIGNED32        0x0007
#define DTYPE_REAL32            0x0008
#define DTYPE_VISIBLE_STRING    0x0009
#define DTYPE_OCTET_STRING      0x000A
#define DTYPE_UNICODE_STRING    0x000B
#define DTYPE_INTEGER24         0x0010
#define DTYPE_UNSIGNED24        0x0016
#define DTYPE_INTEGER64         0x0015
#define DTYPE_UNSIGNED64        0x001B
#define DTYPE_REAL64            0x0011
#define DTYPE_PDO_MAPPING       0x0021
#define DTYPE_IDENTITY          0x0023
#define DTYPE_BIT1              0x0030
#define DTYPE_BIT2              0x0031
#define DTYPE_BIT3              0x0032
#define DTYPE_BIT4              0x0033
#define DTYPE_BIT5              0x0034
#define DTYPE_BIT6              0x0035
#define DTYPE_BIT7              0x0036
#define DTYPE_BIT8              0x0037

#define ATYPE_R                 0x07
#define ATYPE_RW                0x3F
#define ATYPE_RWpre             0x0F
#define ATYPE_RXPDO             0x40
#define ATYPE_TXPDO             0x80

#define DIGITAL_INPUTS          0x12
#define DIGITAL_OUTPUTS         0x06

_ac acName1000[]="Device Type";
_ac acName1008[]="Manufacturer Device Name";
_ac acName1009[]="Manufacturer Hardware Version";
_ac acName100A[]="Manufacturer Software Version";
_ac acName1018[]="Identity Object";
_ac acName1018_01[]="Vendor ID";
_ac acName1018_02[]="Product Code";
_ac acName1018_03[]="Revision Number";
_ac acName1018_04[]="Serial Number";
_ac acNameMO[]="Mapped object";
_ac acName1600[]="Receive PDO mapping";    //RxPDO
_ac acName1A00[]="Transmit PDO mapping";   //TxPDO
_ac acName1C00[]="Sync Manager Communication type";
_ac acName1C00_01[]="Communications type SM0";
_ac acName1C00_02[]="Communications type SM1";
_ac acName1C00_03[]="Communications type SM2";
_ac acName1C00_04[]="Communications type SM3";
_ac acName1C10[]="Sync Manager 0 PDO Assignment";
_ac acName1C11[]="Sync Manager 1 PDO Assignment";
_ac acName1C12[]="Sync Manager 2 PDO Assignment";
_ac acName1C13[]="Sync Manager 3 PDO Assignment";
_ac acNameNOE[]="Number of entries";

_ac acName6000[]="MISO";
_ac acName6000_01[]="digital_in";
//_ac acName6001[]="Encoder input";
_ac acName6001_01[]="encoder_1";
_ac acName6001_02[]="encoder_2";
_ac acName6001_03[]="encoder_3";
//_ac acName6002[]="Current input";
_ac acName6002_01[]="current_1";
_ac acName6002_02[]="current_2";
_ac acName6002_03[]="current_3";
//_ac acName6003[]="Calipher input";
_ac acName6003_01[]="calipher_1";
_ac acName6003_02[]="calipher_2";
//_ac acName6004[]="Force input";
_ac acName6004_01[]="force_1";
_ac acName6004_02[]="force_2";
_ac acName6004_03[]="force_3";
//_ac acName6005[]="Position input";
_ac acName6005_01[]="position_1";
_ac acName6005_02[]="position_2";
_ac acName6005_03[]="position_3";
//_ac acName6006[]="Spare input";
_ac acName6006_01[]="spare_ai_1";
_ac acName6006_02[]="spare_ai_2";
//_ac acName6007[]="Timestamp input";
_ac acName6007_01[]="timestamp";

/*
_ac acName6002[]="Voltage and current inputs";
_ac acName6002_01[]="supply_int_5v";
_ac acName6002_02[]="supply_int_12v";
_ac acName6002_03[]="supply_ext_24v";
_ac acName6002_04[]="current_motor_1";
_ac acName6002_05[]="current_motor_2";
_ac acName6002_06[]="current_motor_3";
_ac acName6002_07[]="supply_int_1v2";
_ac acName6002_08[]="supply_int_1v65";

_ac acName6003[]="Status";
_ac acName6003_01[]="message_index";
_ac acName6003_02[]="actuator_id";
*/
_ac acName7000[]="MOSI";
_ac acName7000_01[]="digital_out";
_ac acName7001_01[]="m_1";
_ac acName7001_02[]="m_2";
_ac acName7001_03[]="m_3";
_ac acName7002_01[]="aout_1";
_ac acName7002_02[]="aout_2";

char ac1008_00[]="TUeES30";
char ac1009_00[]="1.0";
char ac100A_00[]="1.0";

_objd SDO1000[]= {{0x00,DTYPE_UNSIGNED32,32,ATYPE_R,&acName1000[0],0x12345678}};
_objd SDO1008[]= {{0x00,DTYPE_VISIBLE_STRING,sizeof(ac1008_00)<<3,ATYPE_R,&acName1008[0],0,&ac1008_00[0]}};
_objd SDO1009[]= {{0x00,DTYPE_VISIBLE_STRING,sizeof(ac1009_00)<<3,ATYPE_R,&acName1009[0],0,&ac1009_00[0]}};
_objd SDO100A[]= {{0x00,DTYPE_VISIBLE_STRING,sizeof(ac100A_00)<<3,ATYPE_R,&acName100A[0],0,&ac100A_00[0]}};

_objd SDO1018[]=
{{0x00,DTYPE_UNSIGNED8,8,ATYPE_R,&acNameNOE[0],0x04},
  {0x01,DTYPE_UNSIGNED32,32,ATYPE_R,&acName1018_01[0],0x00000683},
  {0x02,DTYPE_UNSIGNED32,32,ATYPE_R,&acName1018_02[0],0x01366401},
  {0x03,DTYPE_UNSIGNED32,32,ATYPE_R,&acName1018_03[0],SW_VERSION},
  {0x04,DTYPE_UNSIGNED32,32,ATYPE_R,&acName1018_04[0],0x00000000}
};

_objd SDO1C00[]=
{{0x00,DTYPE_UNSIGNED8,8,ATYPE_R,&acNameNOE[0],0x04},
  {0x01,DTYPE_UNSIGNED8,8,ATYPE_R,&acName1C00_01[0],0x01},
  {0x02,DTYPE_UNSIGNED8,8,ATYPE_R,&acName1C00_02[0],0x02},
  {0x03,DTYPE_UNSIGNED8,8,ATYPE_R,&acName1C00_03[0],0x03},
  {0x04,DTYPE_UNSIGNED8,8,ATYPE_R,&acName1C00_04[0],0x04}
};

_objd SDO1C10[]={{0x00,DTYPE_UNSIGNED8,8,ATYPE_R,&acName1C10[0],0x00}};
_objd SDO1C11[]={{0x00,DTYPE_UNSIGNED8,8,ATYPE_R,&acName1C11[0],0x00}};
_objd SDO1C12[]={{0x00,DTYPE_UNSIGNED8,8,ATYPE_R,&acNameNOE[0],0x01},
                 {0x01,DTYPE_UNSIGNED16,16,ATYPE_R,&acNameMO[0],0x1600}
};

_objd SDO1C13[]=
{{0x00,DTYPE_UNSIGNED8,8,ATYPE_R,&acNameNOE[0],0x01},
  {0x01,DTYPE_UNSIGNED16,16,ATYPE_R,&acNameMO[0],0x1A00}
};

_objd SDO1A00[]={
  {0x00,DTYPE_UNSIGNED8 , 8,ATYPE_R,&acNameNOE[0],DIGITAL_INPUTS},
  {0x01,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x60000108},
  {0x02,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x60000210},
  {0x03,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x60000310},
  {0x04,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x60000410},
  {0x05,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x60000510},
  {0x06,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x60000610},
  {0x07,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x60000710},
  {0x08,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x60000810},
  {0x09,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x60000910},
  {0x0a,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x60000a10},
  {0x0b,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x60000b10},
  {0x0c,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x60000c10},
  {0x0d,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x60000d10},
  {0x0e,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x60000e10},
  {0x0f,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x60000f10},
  {0x10,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x60001010},
  {0x11,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x60001110},
  {0x12,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x60001210}
};

_objd SDO6000[]={
  {0x00,DTYPE_UNSIGNED8 , 8,ATYPE_R,&acNameNOE[0]    ,DIGITAL_INPUTS},
  {0x01,DTYPE_UNSIGNED8 , 8,ATYPE_R,&acName6000_01[0],0,&(miso_packet.digital_in.port)},
  {0x02,DTYPE_UNSIGNED16,16,ATYPE_R,&acName6001_01[0],0,&(miso_packet.encoder_1)},
  {0x03,DTYPE_UNSIGNED16,16,ATYPE_R,&acName6001_02[0],0,&(miso_packet.encoder_2)},
  {0x04,DTYPE_UNSIGNED16,16,ATYPE_R,&acName6001_03[0],0,&(miso_packet.encoder_3)},
  {0x05,DTYPE_INTEGER16 ,16,ATYPE_R,&acName6002_01[0],0,&(miso_packet.current_1)},
  {0x06,DTYPE_INTEGER16 ,16,ATYPE_R,&acName6002_02[0],0,&(miso_packet.current_2)},
  {0x07,DTYPE_INTEGER16 ,16,ATYPE_R,&acName6002_03[0],0,&(miso_packet.current_3)},
  {0x08,DTYPE_UNSIGNED16,16,ATYPE_R,&acName6003_01[0],0,&(miso_packet.calipher_1)},
  {0x09,DTYPE_UNSIGNED16,16,ATYPE_R,&acName6003_02[0],0,&(miso_packet.calipher_2)},
  {0x0a,DTYPE_UNSIGNED16,16,ATYPE_R,&acName6004_01[0],0,&(miso_packet.force_1)},
  {0x0b,DTYPE_UNSIGNED16,16,ATYPE_R,&acName6004_02[0],0,&(miso_packet.force_2)},
  {0x0c,DTYPE_UNSIGNED16,16,ATYPE_R,&acName6004_03[0],0,&(miso_packet.force_3)},
  {0x0d,DTYPE_UNSIGNED16,16,ATYPE_R,&acName6005_01[0],0,&(miso_packet.pos_1)},
  {0x0e,DTYPE_UNSIGNED16,16,ATYPE_R,&acName6005_02[0],0,&(miso_packet.pos_2)},
  {0x0f,DTYPE_UNSIGNED16,16,ATYPE_R,&acName6005_03[0],0,&(miso_packet.pos_3)},
  {0x10,DTYPE_UNSIGNED16,16,ATYPE_R,&acName6006_01[0],0,&(miso_packet.spare_ai_1)},
  {0x11,DTYPE_UNSIGNED16,16,ATYPE_R,&acName6006_02[0],0,&(miso_packet.spare_ai_1)},
  {0x12,DTYPE_UNSIGNED16,16,ATYPE_R,&acName6007_01[0],0,&(miso_packet.timestamp)}
};

_objd SDO1600[]={
  {0x00,DTYPE_UNSIGNED8 , 8,ATYPE_R,&acNameNOE[0],DIGITAL_OUTPUTS},
  {0x01,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x70000108},
  {0x02,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x70000210},
  {0x03,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x70000310},
  {0x04,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x70000410},
  {0x05,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x70000510},
  {0x06,DTYPE_UNSIGNED32,32,ATYPE_R,&acNameMO[0] ,0x70000610}
};

_objd SDO7000[]={
  {0x00,DTYPE_UNSIGNED8 , 8,ATYPE_R ,&acNameNOE[0]    ,DIGITAL_OUTPUTS},
  {0x01,DTYPE_UNSIGNED8 , 8,ATYPE_RW,&acName7000_01[0],0,&(mosi_packet.digital_out.port)},
  {0x02,DTYPE_INTEGER16 ,16,ATYPE_RW,&acName7001_01[0],0,&(mosi_packet.m_1)},
  {0x03,DTYPE_INTEGER16 ,16,ATYPE_RW,&acName7001_02[0],0,&(mosi_packet.m_2)},
  {0x04,DTYPE_INTEGER16 ,16,ATYPE_RW,&acName7001_03[0],0,&(mosi_packet.m_3)},
  {0x05,DTYPE_INTEGER16 ,16,ATYPE_RW,&acName7002_01[0],0,&(mosi_packet.aout_1)},
  {0x06,DTYPE_INTEGER16 ,16,ATYPE_RW,&acName7002_02[0],0,&(mosi_packet.aout_2)}
};

_objectlist SDOobjects[]={
  {0x1000,OTYPE_VAR     , 0,0,&acName1000[0],&SDO1000[0]},
  {0x1008,OTYPE_VAR     , 0,0,&acName1008[0],&SDO1008[0]},
  {0x1009,OTYPE_VAR     , 0,0,&acName1009[0],&SDO1009[0]},
  {0x100A,OTYPE_VAR     , 0,0,&acName100A[0],&SDO100A[0]},
  {0x1018,OTYPE_RECORD  , 4,0,&acName1018[0],&SDO1018[0]},
  {0x1600,OTYPE_RECORD  , DIGITAL_OUTPUTS,0,&acName1600[0],&SDO1600[0]},
  {0x1A00,OTYPE_RECORD  , DIGITAL_INPUTS,0,&acName1A00[0],&SDO1A00[0]},
  {0x1C00,OTYPE_ARRAY   , 4,0,&acName1C00[0],&SDO1C00[0]},
  {0x1C10,OTYPE_ARRAY   , 0,0,&acName1C10[0],&SDO1C10[0]},
  {0x1C11,OTYPE_ARRAY   , 0,0,&acName1C11[0],&SDO1C11[0]},
  {0x1C12,OTYPE_ARRAY   , 1,0,&acName1C12[0],&SDO1C12[0]},
  {0x1C13,OTYPE_ARRAY   , 1,0,&acName1C13[0],&SDO1C13[0]},
  {0x6000,OTYPE_ARRAY  , DIGITAL_INPUTS,0,&acName6000[0],&SDO6000[0]},
  {0x7000,OTYPE_ARRAY  , DIGITAL_OUTPUTS,0,&acName7000[0],&SDO7000[0]},
  {0xffff,0xff,0xff,0xff,nil,nil}
};

#endif

