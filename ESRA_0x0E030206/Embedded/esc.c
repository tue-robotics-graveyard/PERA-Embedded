/*
 * SOES Simple Open EtherCAT Slave
 *
 * File    : esc.c
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

#include <string.h>
#include <swplatform.h>
#include "utypes.h"
#include "esc.h"
#include "objecttypes.h"

#define BITS2BYTES(b) ((b + 7) >> 3)

int16_t SDO_findobject(uint16_t index)
{
  int16_t n = 0;
  while (SDOobjects[n].index < index)
    {
      n++;
    }
  if (SDOobjects[n].index != index)
    {
      return -1;
    }
  return n;
}

uint16_t sizeTXPDO(void)
{
  uint8_t c , l, si, sic;
  uint16_t size = 0, hobj;
  int16_t nidx;
  _objd *objd;

  if (SDO1C13[0].data)
      si = *((uint8_t *)SDO1C13[0].data);
  else
      si = (uint8_t)SDO1C13[0].value;
  if (si)
    {
      for (sic = 1 ; sic <= si ; sic++)
        {
          if (SDO1C13[sic].data)
            hobj = *((uint16_t *)SDO1C13[sic].data);
          else
            hobj = (uint16_t)SDO1C13[sic].value;
          nidx = SDO_findobject(hobj);
          if (nidx > 0)
            {
              objd = SDOobjects[nidx].objdesc;
              l = (uint8_t)objd->value;
              for (c = 1 ; c <= l ; c++)
                size += ((objd + c)->value & 0xff);
            }
        }
    }
  return BITS2BYTES(size);
}

uint16_t sizeRXPDO(void)
{
  uint8_t c , l, si, sic;
  uint16_t size = 0, hobj;
  int16_t nidx;
  _objd *objd;

  if (SDO1C12[0].data)
      si = *((uint8_t *)SDO1C12[0].data);
  else
      si = (uint8_t)SDO1C12[0].value;
  if (si)
    {
      for (sic = 1 ; sic <= si ; sic++)
        {
          if (SDO1C12[sic].data)
            hobj = *((uint16_t *)SDO1C12[sic].data);
          else
            hobj = (uint16_t)SDO1C12[sic].value;
          nidx = SDO_findobject(hobj);
          if (nidx > 0)
            {
              objd = SDOobjects[nidx].objdesc;
              l = (uint8_t)objd->value;
              for (c = 1 ; c <= l ; c++)
                size += ((objd + c)->value & 0xff);
            }
        }
    }
  return BITS2BYTES(size);
}

int16_t SDO_findsubindex(int16_t nidx, uint8_t subindex)
{
  _objd *objd;
  int16_t n = 0;
  uint8_t maxsub;
  objd = SDOobjects[nidx].objdesc;
  maxsub = SDOobjects[nidx].maxsub;
  while (( (objd + n)->subindex < subindex) && (n < maxsub))
    {
      n++;
    }
  if ((objd + n)->subindex != subindex)
    {
      return -1;
    }
  return n;
}

void copy2mbx(void *source, void *dest, uint16_t size)
{
  memcpy(dest, source, size);
}

void SDO_abort(uint16_t index, uint8_t subindex, uint32_t abortcode)
{
  uint8_t MBXout;
  _COEsdo *coeres;
  MBXout = ESC_claimbuffer();
  if (MBXout)
    {
      coeres = (_COEsdo *)&MBX[MBXout];
      coeres->mbxheader.length = htoes(COE_DEFAULTLENGTH);
      coeres->mbxheader.mbxtype = MBXCOE;
      coeres->coeheader.numberservice = htoes((0 & 0x01f) | (COE_SDOREQUEST << 12));
      coeres->index = htoes(index);
      coeres->subindex = subindex;
      coeres->command = COE_COMMAND_SDOABORT;
      coeres->size = htoel(abortcode);
      MBXcontrol[MBXout].state = MBXstate_outreq;
    }
}

void SDO_upload(void)
{
  _COEsdo *coesdo,*coeres;
  uint16_t index;
  uint8_t subindex;
  int16_t nidx, nsub;
  uint8_t MBXout;
  uint16_t size;
  uint8_t dss;
  _objd *objd;
  coesdo = (_COEsdo *)&MBX[0];
  index = etohs(coesdo->index);
  subindex = coesdo->subindex;
  nidx = SDO_findobject(index);
  if (nidx >= 0)
    {
      nsub = SDO_findsubindex(nidx, subindex);
      if (nsub >= 0)
        {
          objd = SDOobjects[nidx].objdesc;
          MBXout = ESC_claimbuffer();
          if (MBXout)
            {
              coeres = (_COEsdo *)&MBX[MBXout];
              coeres->mbxheader.length = htoes(COE_DEFAULTLENGTH);
              coeres->mbxheader.mbxtype = MBXCOE;
              coeres->coeheader.numberservice = htoes((0 & 0x01f) | (COE_SDORESPONSE << 12));
              size = (objd + nsub)->bitlength;
              // expedited bits used calculation
              dss = 0x0c;
              if (size>8) dss = 0x08;
              if (size>16) dss = 0x04;
              if (size>24) dss = 0x00;
              coeres->index = htoes(index);
              coeres->subindex = subindex;
              if (size <= 32)
                { // expedited response i.e. length<=4 bytes
                  coeres->command = COE_COMMAND_UPLOADRESPONSE +
                                    COE_SIZE_INDICATOR +
                                    COE_EXPEDITED_INDICATOR + dss;
                  if ((objd+nsub)->data == nil)
                    {
                      coeres->size = htoel((objd + nsub)->value); //use constant value
                    }
                  else
                    {
                      size = (size + 7) >> 3; //convert bits to bytes
                      copy2mbx((objd + nsub)->data, &(coeres->size), size); //use dynamic data
                    }
                }
              else
                { // normal response i.e. length>4 bytes
                  coeres->command = COE_COMMAND_UPLOADRESPONSE +
                                    COE_SIZE_INDICATOR;
                  size=(size + 7) >> 3; //convert bits to bytes
                  coeres->size = htoel(size);
                  if ((size + COE_HEADERSIZE) > MBXDSIZE)
                    { // segemented transfer needed
                      ESCvar.frags = size; // set total size in bytes
                      size = MBXDSIZE - COE_HEADERSIZE; //limit to mailbox size
                      ESCvar.fragsleft = size; // number of bytes done
                      ESCvar.segmented = MBXSEU; // signal segmented transfer
                      ESCvar.data = (objd + nsub)->data;
                    }
                  else
                    {
                      ESCvar.segmented = 0;
                    }
                  coeres->mbxheader.length = htoes(COE_HEADERSIZE + size);
                  copy2mbx((objd + nsub)->data, (&(coeres->size)) + 1, size); //use dynamic data
                }
              MBXcontrol[MBXout].state = MBXstate_outreq;
            }
        }
      else
        {
          SDO_abort(index, subindex, ABORT_NOSUBINDEX);
        }
    }
  else
    {
      SDO_abort(index, subindex, ABORT_NOOBJECT);
    }
  MBXcontrol[0].state = MBXstate_idle;
  ESCvar.xoe = 0;
}

void SDO_uploadsegment(void)
{
  _COEsdo *coesdo, *coeres;
  uint8_t MBXout;
  uint16_t size, offset;
  coesdo = (_COEsdo *)&MBX[0];
  MBXout = ESC_claimbuffer();
  if (MBXout)
    {
      coeres = (_COEsdo *)&MBX[MBXout];
      offset = ESCvar.fragsleft;
      size = ESCvar.frags - ESCvar.fragsleft;
      coeres->mbxheader.mbxtype = MBXCOE;
      coeres->coeheader.numberservice = htoes((0 & 0x01f) | (COE_SDORESPONSE << 12));
      coeres->command = COE_COMMAND_UPLOADSEGMENT +
                        (coesdo->command & COE_TOGGLEBIT); // copy toggle bit
      if ((size + COE_SEGMENTHEADERSIZE) > MBXDSIZE)
        { // more segemented transfer needed
          size = MBXDSIZE - COE_SEGMENTHEADERSIZE; //limit to mailbox size
          ESCvar.fragsleft += size; // number of bytes done
          coeres->mbxheader.length = htoes(COE_SEGMENTHEADERSIZE + size);
        }
      else
        {// last segment
          ESCvar.segmented = 0;
          ESCvar.frags = 0;
          ESCvar.fragsleft = 0;
          coeres->command += COE_COMMAND_LASTSEGMENTBIT;
          if (size >= 7)
            {
              coeres->mbxheader.length = htoes(COE_SEGMENTHEADERSIZE + size);
            }
          else
            {
              coeres->command += (7 - size) << 1;
              coeres->mbxheader.length = htoes(COE_DEFAULTLENGTH);
            }
        }
      copy2mbx((uint8_t*)ESCvar.data + offset, (&(coeres->command)) + 1, size); //copy to mailbox

      MBXcontrol[MBXout].state = MBXstate_outreq;
    }
  MBXcontrol[0].state = MBXstate_idle;
  ESCvar.xoe = 0;
}

uint8_t ESC_pre_objecthandler(uint16_t index, uint8_t subindex)
{
    if ((index == 0x1c12) && (subindex > 0))
    {
        SDO_abort(index, subindex, ABORT_READONLY);
        return 0;
    }
    if ((index == 0x1c13) && (subindex > 0))
    {
        SDO_abort(index, subindex, ABORT_READONLY);
        return 0;
    }
    return 1;
}

void SDO_download(void)
{
  _COEsdo *coesdo, *coeres;
  uint16_t index;
  uint8_t subindex;
  int16_t nidx, nsub;
  uint8_t MBXout;
  uint16_t size, actsize;
  _objd *objd;
  uint32_t *mbxdata;
  coesdo = (_COEsdo *)&MBX[0];
  index = etohs(coesdo->index);
  subindex = coesdo->subindex;
  nidx = SDO_findobject(index);
  if (nidx >= 0)
    {
      nsub = SDO_findsubindex(nidx, subindex);
      if (nsub >= 0)
        {
          objd = SDOobjects[nidx].objdesc;
          if (((objd + nsub)->access == ATYPE_RW) ||
              (((objd + nsub)->access == ATYPE_RWpre) && ((ESCvar.ALstatus & 0x0f) == ESCpreop)))
            {
              if (coesdo->command & COE_EXPEDITED_INDICATOR) //expedited?
                {
                  size = 4 - ((coesdo->command & 0x0c) >> 2);
                  mbxdata = &(coesdo->size);
                }
              else // normal upload
                {
                  size = (etohs(coesdo->size) & 0xffff);
                  mbxdata = (&(coesdo->size)) + 1;
                }
              actsize = ((objd + nsub)->bitlength + 7) >> 3;
              if ( actsize == size )
                {
                  copy2mbx(mbxdata, (objd + nsub)->data, size);
                  if (ESC_pre_objecthandler(index, subindex))
                  {
                    MBXout = ESC_claimbuffer();
                    if (MBXout)
                    {
                        coeres = (_COEsdo *)&MBX[MBXout];
                        coeres->mbxheader.length = htoes(COE_DEFAULTLENGTH);
                        coeres->mbxheader.mbxtype = MBXCOE;
                        coeres->coeheader.numberservice = htoes((0 & 0x01f) | (COE_SDORESPONSE << 12));
                        coeres->index = htoes(index);
                        coeres->subindex = subindex;
                        coeres->command = COE_COMMAND_DOWNLOADRESPONSE;
                        coeres->size = htoel(0);
                        MBXcontrol[MBXout].state = MBXstate_outreq;
                    }
                  }
                    // external object write handler
                    ESC_objecthandler(index, subindex);
                }
              else
                {
                  SDO_abort(index, subindex, ABORT_TYPEMISMATCH);
                }
            }
          else
            {
              if((objd + nsub)->access == ATYPE_RWpre)
                  SDO_abort(index, subindex, ABORT_NOTINTHISSTATE);
              else
                  SDO_abort(index, subindex, ABORT_READONLY);
            }
        }
      else
        {
          SDO_abort(index, subindex, ABORT_NOSUBINDEX);
        }
    }
  else
    {
      SDO_abort(index, subindex, ABORT_NOOBJECT);
    }
  MBXcontrol[0].state = MBXstate_idle;
  ESCvar.xoe = 0;
}

void SDO_infoerror(uint32_t abortcode)
{
  uint8_t MBXout;
  _COEobjdesc *coeres;
  MBXout = ESC_claimbuffer();
  if (MBXout)
    {
      coeres = (_COEobjdesc *)&MBX[MBXout];
      coeres->mbxheader.length = htoes((uint16_t)0x0a);
      coeres->mbxheader.mbxtype = MBXCOE;
      coeres->coeheader.numberservice = htoes((0 & 0x01f) | (COE_SDOINFORMATION << 12));
      coeres->infoheader.opcode = COE_INFOERROR; //SDO info error request
      coeres->infoheader.incomplete = 0;
      coeres->infoheader.reserved = 0x00;
      coeres->infoheader.fragmentsleft = 0;
      coeres->index = htoel(abortcode);
      MBXcontrol[MBXout].state = MBXstate_outreq;
    }
}

#define ODLISTSIZE  ((MBX1_sml - MBXHSIZE - sizeof(_COEh) - sizeof(_INFOh) - 2) & 0xfffe)

void SDO_getodlist(void)
{
  uint16_t frags;
  uint8_t MBXout = 0;
  uint16_t entries = 0;
  uint16_t i, n;
  uint16_t *p;
  _COEobjdesc *coel, *coer;

  while (SDOobjects[entries].index != 0xffff) entries++;
  ESCvar.entries = entries;
  frags = ((entries << 1) + ODLISTSIZE - 1);
  frags /= ODLISTSIZE;
  coer = (_COEobjdesc *)&MBX[0];
  if (etohs(coer->index) > 0x01) // check for unsupported opcodes
    {
      SDO_infoerror(ABORT_UNSUPPORTED);
    }
  else
    {
      MBXout = ESC_claimbuffer();
    }
  if (MBXout)
    {
      coel = (_COEobjdesc *)&MBX[MBXout];
      coel->mbxheader.mbxtype = MBXCOE;
      coel->coeheader.numberservice = htoes((0 & 0x01f) | (COE_SDOINFORMATION << 12));
      coel->infoheader.opcode = COE_GETODLISTRESPONSE;
      if (etohs(coer->index) == 0x00) //number of objects request
        {
          coel->index = htoes((uint16_t)0x00);
          coel->infoheader.incomplete = 0;
          coel->infoheader.reserved = 0x00;
          coel->infoheader.fragmentsleft = htoes((uint16_t)0);
          MBXcontrol[0].state = MBXstate_idle;
          ESCvar.xoe = 0;
          ESCvar.frags = frags;
          ESCvar.fragsleft = frags - 1;
          p = &(coel->datatype);
          *p = htoes(entries);
          p++;
          *p = 0;
          p++;
          *p = 0;
          p++;
          *p = 0;
          p++;
          *p = 0;
          coel->mbxheader.length = htoes(0x08 + (5 << 1));
        }
      if (etohs(coer->index) == 0x01) //only return all objects
        {
          if (frags > 1)
            {
              coel->infoheader.incomplete = 1;
              ESCvar.xoe = MBXCOE + MBXODL;
              n = ODLISTSIZE >> 1;
            }
          else
            {
              coel->infoheader.incomplete = 0;
              MBXcontrol[0].state = MBXstate_idle;
              ESCvar.xoe = 0;
              n = entries;
            }
          coel->infoheader.reserved = 0x00;
          ESCvar.frags = frags;
          ESCvar.fragsleft = frags - 1;
          coel->infoheader.fragmentsleft = htoes(ESCvar.fragsleft);
          coel->index = htoes((uint16_t)0x01);

          p = &(coel->datatype);
          for (i = 0 ; i < n ; i++)
            {
              *p = htoes(SDOobjects[i].index);
              p++;
            }

          coel->mbxheader.length = htoes(0x08 + ( n << 1));
        }
      MBXcontrol[MBXout].state = MBXstate_outreq;
    }
}

void SDO_getodlistcont(void)
{
  uint8_t MBXout;
  uint16_t i , n, s;
  uint16_t *p;
  _COEobjdesc *coel;

  MBXout = ESC_claimbuffer();
  if (MBXout)
    {
      coel = (_COEobjdesc *)&MBX[MBXout];
      coel->mbxheader.mbxtype = MBXCOE;
      coel->coeheader.numberservice = htoes((0 & 0x01f) | (COE_SDOINFORMATION << 12));
      coel->infoheader.opcode = COE_GETODLISTRESPONSE;
      s = (ESCvar.frags - ESCvar.fragsleft) * (ODLISTSIZE >> 1);
      if (ESCvar.fragsleft > 1)
        {
          coel->infoheader.incomplete = 1;
          n = s + (ODLISTSIZE >> 1);
        }
      else
        {
          coel->infoheader.incomplete = 0;
          MBXcontrol[0].state = MBXstate_idle;
          ESCvar.xoe = 0;
          n = ESCvar.entries;
        }
      coel->infoheader.reserved = 0x00;
      ESCvar.fragsleft--;
      coel->infoheader.fragmentsleft = htoes(ESCvar.fragsleft);
      p = &(coel->index); //pointer 2 bytes back to exclude index
      for ( i = s ; i < n ; i++)
        {
          *p = htoes(SDOobjects[i].index);
          p++;
        }
      coel->mbxheader.length = htoes(0x06 + ((n - s) << 1));
      MBXcontrol[MBXout].state = MBXstate_outreq;
    }
}

void SDO_getod(void)
{
  uint8_t MBXout;
  uint16_t index;
  int16_t nidx;
  uint8_t *d;
  uint8_t *s;
  uint8_t n = 0;
  _COEobjdesc *coer, *coel;
  coer = (_COEobjdesc *)&MBX[0];
  index = etohs(coer->index);
  nidx = SDO_findobject(index);
  if (nidx >= 0)
    {
      MBXout = ESC_claimbuffer();
      if (MBXout)
        {
          coel = (_COEobjdesc *)&MBX[MBXout];
          coel->mbxheader.mbxtype = MBXCOE;
          coel->coeheader.numberservice = htoes((0 & 0x01f) | (COE_SDOINFORMATION << 12));
          coel->infoheader.opcode = COE_GETODRESPONSE;
          coel->infoheader.incomplete = 0;
          coel->infoheader.reserved = 0x00;
          coel->infoheader.fragmentsleft = htoes(0);
          coel->index = htoes(index);
          coel->datatype = htoes(0);
          coel->maxsub = SDOobjects[nidx].maxsub;
          coel->objectcode = (unsigned char)(SDOobjects[nidx].objtype);
          s = (uint8_t *)SDOobjects[nidx].name;
          d = (uint8_t *)&(coel->name);
          while (*s && (n < (MBXDSIZE - 0x0c)))
            {
              *d = *s;
              n++;
              s++;
              d++;
            }
          *d = *s;
          coel->mbxheader.length = htoes((uint16_t)0x0c + n);
          MBXcontrol[MBXout].state = MBXstate_outreq;
          MBXcontrol[0].state = MBXstate_idle;
          ESCvar.xoe=0;
        }
    }
  else
    {
      SDO_infoerror(ABORT_NOOBJECT);
    }
}

void SDO_geted(void)
{
  uint8_t MBXout;
  uint16_t index;
  int16_t nidx, nsub;
  uint8_t subindex;
  uint8_t *d;
  uint8_t *s;
  _objd *objd;
  uint8_t n = 0;
  _COEentdesc *coer, *coel;
  coer = (_COEentdesc *)&MBX[0];
  index = etohs(coer->index);
  subindex = coer->subindex;
  nidx = SDO_findobject(index);
  if (nidx >= 0)
    {
      nsub = SDO_findsubindex(nidx, subindex);
      if (nsub >= 0)
        {
          objd = SDOobjects[nidx].objdesc;
          MBXout = ESC_claimbuffer();
          if (MBXout)
            {
              coel = (_COEentdesc *)&MBX[MBXout];
              coel->mbxheader.mbxtype = MBXCOE;
              coel->coeheader.numberservice = htoes((0 & 0x01f) | (COE_SDOINFORMATION << 12));
              coel->infoheader.opcode = COE_ENTRYDESCRIPTIONRESPONSE;
              coel->infoheader.incomplete = 0;
              coel->infoheader.reserved = 0x00;
              coel->infoheader.fragmentsleft = htoes((uint16_t)0);
              coel->index = htoes(index);
              coel->subindex = subindex;
              coel->valueinfo = COE_VALUEINFO_ACCESS +
                                COE_VALUEINFO_OBJECT +
                                COE_VALUEINFO_MAPPABLE;
              coel->datatype = htoes((objd + nsub)->datatype);
              coel->bitlength = htoes((objd + nsub)->bitlength);
              coel->access = htoes((objd + nsub)->access);
              s = (uint8_t *)(objd+nsub)->name;
              d = (uint8_t *)&(coel->name);
              while (*s && (n < (MBXDSIZE - 0x10)))
                {
                  *d = *s;
                  n++;
                  s++;
                  d++;
                }
              *d = *s;
              coel->mbxheader.length = htoes((uint16_t)0x10 + n);
              MBXcontrol[MBXout].state = MBXstate_outreq;
              MBXcontrol[0].state = MBXstate_idle;
              ESCvar.xoe = 0;
            }
        }
      else
        {
          SDO_infoerror(ABORT_NOSUBINDEX);
        }
    }
  else
    {
      SDO_infoerror(ABORT_NOOBJECT);
    }
}

void ESC_coeprocess(void)
{
  _MBXh *mbh;
  _COEsdo *coesdo;
  _COEobjdesc *coeobjdesc;
  uint8_t service;
  if (!MBXrun)
    {
      return;
    }
  if (!ESCvar.xoe && (MBXcontrol[0].state == MBXstate_inclaim))
    {
      mbh = (_MBXh *)&MBX[0];
      if (mbh->mbxtype == MBXCOE)
        {
            if (mbh->length < 8)
            {
                MBX_error(MBXERR_INVALIDSIZE);
            }
            else
                ESCvar.xoe = MBXCOE;
        }
    }
  if ((ESCvar.xoe == (MBXCOE + MBXODL)) && (!ESCvar.mbxoutpost))
    {
      SDO_getodlistcont(); // continue get OD list
    }
  if (ESCvar.xoe == MBXCOE)
    {
      coesdo = (_COEsdo *)&MBX[0];
      coeobjdesc = (_COEobjdesc *)&MBX[0];
      service = etohs(coesdo->coeheader.numberservice) >> 12;
      //initiate SDO upload request
      if ((service == COE_SDOREQUEST)
          && (coesdo->command == COE_COMMAND_UPLOADREQUEST)
          && (etohs(coesdo->mbxheader.length) == 0x0a))
        {
          SDO_upload();
        }
      //SDO upload segment request
      if ((service == COE_SDOREQUEST)
          && ((coesdo->command & 0xef) == COE_COMMAND_UPLOADSEGREQ)
          && (etohs(coesdo->mbxheader.length) == 0x0a)
          && (ESCvar.segmented == MBXSEU))
        {
          SDO_uploadsegment();
        }
      //initiate SDO download request
      else
        if ((service == COE_SDOREQUEST)
            && ((coesdo->command & 0xf1) == 0x21))
          {
            SDO_download();
          }
      //initiate SDO get OD list
        else
          if ((service == COE_SDOINFORMATION)
              &&(coeobjdesc->infoheader.opcode == 0x01))
            {
              SDO_getodlist();
            }
      //initiate SDO get OD
          else
            if ((service == COE_SDOINFORMATION)
                && (coeobjdesc->infoheader.opcode == 0x03))
              {
                SDO_getod();
              }
      //initiate SDO get ED
            else
              if ((service == COE_SDOINFORMATION)
                  && (coeobjdesc->infoheader.opcode == 0x05))
                {
                  SDO_geted();
                }
              else
                if (ESCvar.xoe == MBXCOE) //COE not recognised above
                  {
                    if (service == 0)
                    {
                      MBX_error(MBXERR_INVALIDHEADER);
                    }
                    else
                    {
                      SDO_abort(etohs(coesdo->index), coesdo->subindex, ABORT_UNKNOWN);
                    }
                    MBXcontrol[0].state = MBXstate_idle;
                    ESCvar.xoe = 0;
                  }
    }
}

void ESC_ALerror(uint16_t errornumber)
{
  uint16_t dummy;
  ESCvar.ALerror = errornumber;
  dummy = htoes(errornumber);
  ESC_write(ESCREG_ALERROR, (uint8_t*)&dummy, sizeof(dummy), (uint8_t*)&ESCvar.ALevent);
}

void ESC_ALstatus(uint8_t status)
{
  uint16_t dummy;
  ESCvar.ALstatus = status;
  dummy = htoes((uint16_t)status);
  ESC_write(ESCREG_ALSTATUS, (uint8_t*)&dummy, sizeof(dummy), (uint8_t*)&ESCvar.ALevent);
}

void ESC_SMack(uint8_t n)
{
  uint16_t dummy;
  ESC_read(ESCREG_SM0STATUS + (n << 3), (uint8_t*)&dummy, 2, (uint8_t*)&ESCvar.ALevent);
}

void ESC_SMstatus(uint8_t n)
{
  _ESCsm2 *sm;
  uint8_t temp[2];
  sm = (_ESCsm2 *)&ESCvar.SM[n];
  ESC_read(ESCREG_SM0STATUS + (n << 3), (uint8_t*)&temp, 2, (uint8_t*)&ESCvar.ALevent);
  sm->ActESC = temp[1];
  sm->Status = temp[0];
}

void ESC_SMwritepdi(uint8_t n)
{
  _ESCsm2 *sm;
  sm = (_ESCsm2 *)&ESCvar.SM[n];
  ESC_write(ESCREG_SM0PDI + (n << 3), &(sm->ActPDI), 1, (void *)&ESCvar.ALevent);
}

void ESC_SMenable(uint8_t n)
{
  _ESCsm2 *sm;
  sm = (_ESCsm2 *)&ESCvar.SM[n];
  sm->ActPDI &= ~ESCREG_SMENABLE_BIT;
  ESC_SMwritepdi(n);
}

void ESC_SMdisable(uint8_t n)
{
  _ESCsm2 *sm;
  sm = (_ESCsm2 *)&ESCvar.SM[n];
  sm->ActPDI |= ESCREG_SMENABLE_BIT;
  ESC_SMwritepdi(n);
}

void ESC_address(void)
{
  ESC_read(ESCREG_ADDRESS, (uint8_t*)&ESCvar.address, sizeof(ESCvar.address), (uint8_t*)&ESCvar.ALevent);
  ESCvar.address = etohs(ESCvar.address);
}

uint8_t ESC_WDstatus(void)
{
  uint16_t wdstatus;
  ESC_read(ESCREG_WDSTATUS, (uint8_t*)&wdstatus, 2, (uint8_t*)&ESCvar.ALevent);
  wdstatus = etohs(wdstatus);
  return (uint8_t)wdstatus;
}

uint8_t ESC_checkmbx(uint8_t state)
{
  _ESCsm2 *SM;
  ESC_read(ESCREG_SM0, (void *)&ESCvar.SM[0], sizeof(ESCvar.SM[0]), (void *)&ESCvar.ALevent);
  ESC_read(ESCREG_SM1, (void *)&ESCvar.SM[1], sizeof(ESCvar.SM[1]), (void *)&ESCvar.ALevent);
  SM = (_ESCsm2 *)&ESCvar.SM[0];
  if ((etohs(SM->PSA) != MBX0_sma) || (etohs(SM->Length) != MBX0_sml) || (SM->Command != MBX0_smc) || (ESCvar.SM[0].ECsm == 0))
    {
      ESCvar.SMtestresult = SMRESULT_ERRSM0;
      ESC_SMdisable(0);
      ESC_SMdisable(1);
      return (uint8_t)(ESCinit | ESCerror); //fail state change
    }
  SM = (_ESCsm2 *)&ESCvar.SM[1];
  if ((etohs(SM->PSA) != MBX1_sma) || (etohs(SM->Length) != MBX1_sml) || (SM->Command != MBX1_smc) || (ESCvar.SM[1].ECsm == 0))
    {
      ESCvar.SMtestresult = SMRESULT_ERRSM1;
      ESC_SMdisable(0);
      ESC_SMdisable(1);
      return ESCinit | ESCerror; //fail state change
    }
  return state;
}

uint8_t ESC_startmbx(uint8_t state)
{
  ESC_SMenable(0);
  ESC_SMenable(1);
  ESC_SMstatus(0);
  ESC_SMstatus(1);
  if ((state = ESC_checkmbx(state)) & ESCerror)
    {
      ESC_ALerror(ALERR_INVALIDMBXCONFIG);
      MBXrun = 0;
    }
  else
    {
      ESCvar.toggle = ESCvar.SM[1].ECrep; //sync repeat request toggle state
      MBXrun = 1;
    }
  return state;
}

void ESC_stopmbx(void)
{
  uint8_t n;
  MBXrun = 0;
  ESC_SMdisable(0);
  ESC_SMdisable(1);
  for (n = 0 ; n < MBXBUFFERS ; n++) MBXcontrol[n].state = MBXstate_idle;
  ESCvar.mbxoutpost = 0;
  ESCvar.mbxbackup = 0;
  ESCvar.xoe = 0;
  ESCvar.mbxfree = 1;
  ESCvar.toggle = 0;
  ESCvar.mbxincnt = 0;
  ESCvar.segmented = 0;
  ESCvar.frags = 0;
  ESCvar.fragsleft = 0;
  ESCvar.txcue = 0;
}

void ESC_readmbx(void)
{
  _MBX *MB = &MBX[0];
  uint16_t length;
  ESC_read(MBX0_sma, (uint8_t*)MB,MBXHSIZE, (uint8_t*)&ESCvar.ALevent);
  length = etohs(MB->header.length);
  if (length > (MBX0_sml - MBXHSIZE)) length = MBX0_sml - MBXHSIZE;
  ESC_read(MBX0_sma + MBXHSIZE, &(MB->b[0]), length, (uint8_t*)&ESCvar.ALevent);
  if (length + MBXHSIZE < MBX0_sml)
    {
      ESC_read(MBX0_sme, (uint8_t*)&length, 1, (uint8_t*)&ESCvar.ALevent);
    }
  MBXcontrol[0].state = MBXstate_inclaim;
}

void ESC_writembx(uint8_t n)
{
  _MBX *MB = &MBX[n];
  uint8_t dummy = 0;
  uint16_t length;
  length = etohs(MB->header.length);
  if (length > (MBX1_sml - MBXHSIZE)) length = MBX1_sml - MBXHSIZE;
  ESC_write(MBX1_sma, (uint8_t*)MB, MBXHSIZE + length, (uint8_t*)&ESCvar.ALevent);
  if (length + MBXHSIZE < MBX1_sml)
    {
      ESC_write(MBX1_sme, &dummy, 1, (uint8_t*)&ESCvar.ALevent);
    }
  ESCvar.mbxfree = 0;
}

void ESC_ackmbxread(void)
{
  uint8_t dummy = 0;
  ESC_write(MBX1_sma, &dummy, 1, (uint8_t*)&ESCvar.ALevent);
  ESCvar.mbxfree = 1;
}

uint8_t ESC_claimbuffer(void)
{
  _MBX *MB;
  uint8_t n = MBXBUFFERS - 1;
  while ((n > 0) && (MBXcontrol[n].state)) n--;
  if (n)
    {
      MBXcontrol[n].state = MBXstate_outclaim;
      MB = &MBX[n];
      ESCvar.mbxcnt++;
      ESCvar.mbxcnt&=0x07;
      if (ESCvar.mbxcnt == 0) ESCvar.mbxcnt = 1;
      MB->header.address = htoes(0x0000); // destination is master
      MB->header.channel = 0;
      MB->header.priority = 0;
      MB->header.mbxcnt = ESCvar.mbxcnt;
      ESCvar.txcue++;
    }
  return n;
}

uint8_t ESC_outreqbuffer(void)
{
  uint8_t n = MBXBUFFERS-1;
  while ((n > 0) && (MBXcontrol[n].state != MBXstate_outreq)) n--;
  return n;
}

void MBX_error(uint16_t error)
{
  uint8_t MBXout;
  _MBXerr *mbxerr;
  MBXout = ESC_claimbuffer();
  if (MBXout)
    {
      mbxerr = (_MBXerr *)&MBX[MBXout];
      mbxerr->mbxheader.length = htoes((uint16_t)0x04);
      mbxerr->mbxheader.mbxtype = MBXERR;
      mbxerr->type = htoes((uint16_t)0x01);
      mbxerr->detail = htoes(error);
      MBXcontrol[MBXout].state = MBXstate_outreq;
    }
}

uint8_t ESC_mbxprocess(void)
{
  uint8_t mbxhandle = 0;
  _MBX *MB = &MBX[0];

  if (!MBXrun)
    {
      return 0;  //nothing to do
    }
  if (ESCvar.ALevent & ESCREG_ALEVENT_SM_MASK) // SM0/1 access or SMn change event
    {
      ESC_SMstatus(0);
      ESC_SMstatus(1);
    }
  if (ESCvar.mbxoutpost && ESCvar.SM[1].IntR) //outmbx read by master
    {
      ESC_ackmbxread();
      if (ESCvar.mbxbackup) // dispose old backup
        {
          MBXcontrol[ESCvar.mbxbackup].state = MBXstate_idle;
        }
      if (MBXcontrol[ESCvar.mbxoutpost].state == MBXstate_again) // if still to do
        {
          ESC_writembx(ESCvar.mbxoutpost);
        }
      MBXcontrol[ESCvar.mbxoutpost].state = MBXstate_backup; //create new backup
      ESCvar.mbxbackup = ESCvar.mbxoutpost;
      ESCvar.mbxoutpost = 0;
      return 0;
    }
  if (ESCvar.SM[1].ECrep != ESCvar.toggle) // repeat request
    {
      if (ESCvar.mbxoutpost || ESCvar.mbxbackup)
        {
          if (!ESCvar.mbxoutpost) // if outmbx empty
            {
              ESC_writembx(ESCvar.mbxbackup); // use backup mbx
            }
          else
            {
              ESC_SMdisable(1); // reset mailbox
              MBXcontrol[ESCvar.mbxoutpost].state = MBXstate_again; // have to resend later
              ESC_SMenable(1); // activate mailbox
              ESC_writembx(ESCvar.mbxbackup); // use backup mbx
            }
          ESCvar.toggle = ESCvar.SM[1].ECrep;
          ESCvar.SM[1].PDIrep = ESCvar.toggle;
          ESC_SMwritepdi(1);
        }
      return 0;
    }
// if the outmailbox is free check if we have something to send
  if (ESCvar.txcue && (ESCvar.mbxfree || !ESCvar.SM[1].MBXstat))
    {
      mbxhandle = ESC_outreqbuffer(); // check out request mbx
      if (mbxhandle) // outmbx empty and outreq mbx available
        {
          ESC_writembx(mbxhandle);
          MBXcontrol[mbxhandle].state = MBXstate_outpost; // change state
          ESCvar.mbxoutpost = mbxhandle;
          if (ESCvar.txcue) ESCvar.txcue--;
        }
    }
// read mailbox if full and no xoe in progress
  if (ESCvar.SM[0].MBXstat && !MBXcontrol[0].state && !ESCvar.mbxoutpost && !ESCvar.xoe)
    {
      ESC_readmbx();
      ESCvar.SM[0].MBXstat = 0;
      if (etohs(MB->header.length) < 6)
        {
          if (etohs(MB->header.length) == 0)
            MBX_error(MBXERR_INVALIDHEADER);
          else
            MBX_error(MBXERR_SIZETOOSHORT);
          MBXcontrol[0].state = MBXstate_idle; // drop mailbox
        }
      if ((MB->header.mbxcnt !=0) && (MB->header.mbxcnt == ESCvar.mbxincnt))
        {
          MBXcontrol[0].state = MBXstate_idle; // drop mailbox
        }
      ESCvar.mbxincnt = MB->header.mbxcnt;
      return 1;
    }
  if (ESCvar.ALevent & ESCREG_ALEVENT_SMCHANGE) // ack changes in non used SM
    {
      ESC_SMack(4);
      ESC_SMack(5);
      ESC_SMack(6);
      ESC_SMack(7);
    }
  return 0;
}

void ESC_xoeprocess(void)
{
  _MBXh *mbh;
  if (!MBXrun)
    {
      return;
    }
  if (!ESCvar.xoe && (MBXcontrol[0].state == MBXstate_inclaim))
    {
      mbh = (_MBXh *)&MBX[0];
      if ((mbh->mbxtype == 0) || (mbh->length == 0))
//      if ((mbh->mbxtype == 0) || (etohs(mbh->length) == 0))
      {
        MBX_error(MBXERR_INVALIDHEADER);
      }
      else
      {
        MBX_error(MBXERR_UNSUPPORTEDPROTOCOL);
      }
      MBXcontrol[0].state = MBXstate_idle; // mailbox type not supported, drop mailbox
    }
}

uint8_t ESC_checkSM23(uint8_t state)
{
  _ESCsm2 *SM;
  ESC_read(ESCREG_SM2, (void *)&ESCvar.SM[2], sizeof(ESCvar.SM[2]), (void *)&ESCvar.ALevent);
  ESC_read(ESCREG_SM3, (void *)&ESCvar.SM[3], sizeof(ESCvar.SM[3]), (void *)&ESCvar.ALevent);
  SM = (_ESCsm2 *)&ESCvar.SM[2];
  if ((etohs(SM->PSA) != SM2_sma) || (etohs(SM->Length) != SM2_sml) || (SM->Command != SM2_smc)  || !(SM->ActESC & SM2_act))
    {
      ESCvar.SMtestresult = SMRESULT_ERRSM2;
      return ESCpreop | ESCerror; //fail state change
    }
  SM = (_ESCsm2 *)&ESCvar.SM[3];
  if ((etohs(SM->PSA) != SM3_sma) || (etohs(SM->Length) != SM3_sml) || (SM->Command != SM3_smc) || !(SM->ActESC & SM3_act))
    {
      ESCvar.SMtestresult = SMRESULT_ERRSM3;
      return ESCpreop | ESCerror; //fail state change
    }
  return state;
}

uint8_t ESC_startinput(uint8_t state)
{
  state = ESC_checkSM23(state);
  if (state != (ESCpreop | ESCerror))
    {
      ESC_SMenable(3);
      Ec_state = APPSTATE_INPUT;
    }
  else
    {
      ESC_SMdisable(2);
      ESC_SMdisable(3);
      if( ESCvar.SMtestresult & SMRESULT_ERRSM3 )
        ESC_ALerror(ALERR_INVALIDINPUTSM);
      else
        ESC_ALerror(ALERR_INVALIDOUTPUTSM);
    }
  return state;
}

void ESC_stopinput(void)
{
  Ec_state = APPSTATE_IDLE;
  ESC_SMdisable(3);
  ESC_SMdisable(2);
}

uint8_t ESC_startoutput(uint8_t state)
{
  ESC_SMenable(2);
  Ec_state |= APPSTATE_OUTPUT;
  return state;
}

void ESC_stopoutput(void)
{
  Ec_state &= APPSTATE_INPUT;
  ESC_SMdisable(2);
//  APP_safeoutput();
}

void ESC_ALevent(void)
{
//  if (!(ESCvar.ALevent & (ESCREG_ALEVENT_CONTROL | ESCREG_ALEVENT_SMCHANGE)) &&
//      (ESCvar.wdcnt++ < 1000))
  if (!(ESCvar.ALevent & (ESCREG_ALEVENT_CONTROL | ESCREG_ALEVENT_SMCHANGE)))
    { //nothing to do
      ESCvar.ALcontrol = 0;
      return;
    }
  ESCvar.wdcnt = 0;
  ESC_read(ESCREG_ALCONTROL, (void *)&ESCvar.ALcontrol, sizeof(ESCvar.ALcontrol), (void *)&ESCvar.ALevent);
  ESCvar.ALcontrol = etohs(ESCvar.ALcontrol);
}

uint16_t ESC_state(void)
{
  uint8_t ac, an, as, ax;
  if (!ESCvar.ALcontrol) return(NO_CHANGE); //nothing to do
  ac = ESCvar.ALcontrol & 0x001f;
  as = ESCvar.ALstatus & 0x001f;
  an = as;
  if (((ac & ESCerror) || (ac == ESCinit)))
    {
      ac &= 0x0f;  // if error bit confirmed reset
      an &= 0x0f;
    }
  if ((ESCvar.ALevent & ESCREG_ALEVENT_SMCHANGE) &&
      (as & 0x0e) &&
      !(ESCvar.ALevent & ESCREG_ALEVENT_CONTROL) &&
      MBXrun)
    {
      ESCvar.ALevent = 0;
      ax = ESC_checkmbx(as);
//      if ((as & ESCerror) && ((ac != (ESCinit | ESCerror)) || (ac != ESCinit)))
      if ((as & ESCerror) && !((ac == (ESCinit | ESCerror)) || (ac == ESCinit)))
        return(STATE_ERROR); // if in error then stay there
      if (ax == (ESCinit | ESCerror))
        {
          if (App.state)
            {
              ESC_stopoutput();
              ESC_stopinput();
            }
          ESC_stopmbx();
          ESC_ALerror(ALERR_INVALIDMBXCONFIG);
          MBXrun = 0;
          ESC_ALstatus(ax);
          return(STATE_ERROR);
        }
      ax = ESC_checkSM23(as);
      if ((App.state) && (ax == (ESCpreop | ESCerror)))
        {
          ESC_stopoutput();
          ESC_stopinput();
          if( ESCvar.SMtestresult & SMRESULT_ERRSM3 )
            ESC_ALerror(ALERR_INVALIDINPUTSM);
          else
            ESC_ALerror(ALERR_INVALIDOUTPUTSM);
          ESC_ALstatus(ax);
          return(STATE_ERROR);
        }
    }
  ESCvar.ALevent = 0;
  if ((an & ESCerror) && !(ac & ESCerror)) return(STATE_ERROR); //error state not acked, leave original
  as = (ac << 4) | (as & 0x0f); // high bits ALcommand, low bits ALstatus
  switch (as)
    {
    case INIT_TO_INIT:
    case BOOT_TO_BOOT:
    case PREOP_TO_PREOP:
    case OP_TO_OP:
      break;
    case INIT_TO_PREOP:
      ESC_address(); // get station address
      an = ESC_startmbx(ac);
      break;
    case INIT_TO_BOOT:
      ESCvar.bootstate = 1;
      ESC_address();
      ESC_startmbx(ac);
      an = ESCboot;
      break;
    case INIT_TO_SAFEOP:
    case INIT_TO_OP:
      an = ESCinit | ESCerror;
      ESC_ALerror(ALERR_INVALIDSTATECHANGE);
      break;
    case OP_TO_INIT:
      ESC_stopoutput();
// No break
    case SAFEOP_TO_INIT:
      ESC_stopinput();
// No break
    case PREOP_TO_INIT:
      ESC_stopmbx();
//      FOE_init();
      an = ESCinit;
      break;
    case PREOP_TO_BOOT:
    case BOOT_TO_INIT:
    case BOOT_TO_PREOP:
    case BOOT_TO_SAFEOP:
    case BOOT_TO_OP:
      ESCvar.bootstate = 0;
      an = ESCpreop | ESCerror;
      ESC_ALerror(ALERR_INVALIDSTATECHANGE);
      break;
    case PREOP_TO_SAFEOP:
    case SAFEOP_TO_SAFEOP:
      SM2_sml = sizeRXPDO();
      SM3_sml = sizeTXPDO();
      an = ESC_startinput(ac);
      if (an == ac) ESC_SMenable(2);
      break;
    case PREOP_TO_OP:
      an = ESCpreop | ESCerror;
      ESC_ALerror(ALERR_INVALIDSTATECHANGE);
      break;
    case OP_TO_PREOP:
      ESC_stopoutput();
// No break
    case SAFEOP_TO_PREOP:
      ESC_stopinput();
      an = ESCpreop;
      break;
    case SAFEOP_TO_BOOT:
      an = ESCsafeop | ESCerror;
      ESC_ALerror(ALERR_INVALIDSTATECHANGE);
      break;
    case SAFEOP_TO_OP:
      an = ESC_startoutput(ac);
      break;
    case OP_TO_BOOT:
      an = ESCsafeop | ESCerror;
      ESC_ALerror(ALERR_INVALIDSTATECHANGE);
      ESC_stopoutput();
      break;
    case OP_TO_SAFEOP:
      an = ESCsafeop;
      ESC_stopoutput();
      break;
    default :
      if (an == ESCop)
        {
          ESC_stopoutput();
          an = ESCsafeop;
        }
      if (as == ESCsafeop)
        ESC_stopinput();
      an |= ESCerror;
      ESC_ALerror(ALERR_UNKNOWNSTATE);
    }
  if (!(an & ESCerror) && (ESCvar.ALerror))
    {
      ESC_ALerror(ALERR_NONE); // clear error
    }
  ESC_ALstatus(an);
  return(as);
}

