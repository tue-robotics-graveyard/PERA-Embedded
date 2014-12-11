/*
 * SOES Simple Open EtherCAT Slave
 *
 * File    : foe.c
 * Version : 0.1
 * Date    : 11-30-2010
 * Copyright (C) 2010 ZBE Inc.
 * Copyright (C) 2011 Arthur Ketels.
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
#include <string.h>
#include "utypes.h"
#include "esc.h"
#include "esc_foe.h"

char                  foe_file_name[FOE_FN_MAX + 1];
/* Valid file names. */
static const char     *file_name = "esra";
uint16_t              file_name_len = sizeof(file_name)-1;
uint32_t              file_pass = 0x0;
uint8_t               fbuffer[FOE_PAGESIZE];
uint32_t              flash_pos;
uint32_t              fbuf_pos;
uint8_t               foe_mode;

uint16_t FOE_fopen(char *name, uint16_t num_chars, uint32_t pass, uint8_t op)
{
    uint16_t i;

    //Unpack the file name into characters we can look at.
    if(num_chars > FOE_FN_MAX)
        num_chars = FOE_FN_MAX;
    if(num_chars > file_name_len)
        num_chars = file_name_len;
    for(i = 0; i < num_chars; i++)
    {
        foe_file_name[i] = name[i];
    }
    foe_file_name[i] = 0;

    /* Figure out what file they're talking about. */
    //if(0==strncmp(foe_file_name, file_name, num_chars) && pass == file_pass)
    //{
        switch(op)
        {
        case FOE_OP_RRQ:
            ESCvar.fposition = 0;
            //ESCvar.fend = FOE_MAXDATA - 1;
            ESCvar.fend = FOE_MAXDATA;
            return 0;
        case FOE_OP_WRQ:
            ESCvar.fposition = 0;
            //ESCvar.fend = FOE_MAXDATA - 1;
            ESCvar.fend = FOE_MAXDATA;
            return 0;
        }
    //}

    return FOE_ERR_NOTFOUND;
}

uint8_t FOE_fetchbuffer(void)
{
    if(ESCvar.fbufstate && (ESCvar.fbufposition < FOE_PAGESIZE))
    {
        ESCvar.fposition++;
        return fbuffer[ESCvar.fbufposition++];
    }
    else
    {
        m25px0_read(drv_m25px0_1, ESCvar.fposition, &fbuffer[0], FOE_PAGESIZE);
        //*leds=(uint8_t)(fbuffer[0]);
        ESCvar.fbufposition = 0;
        ESCvar.fbufstate = 1;
        ESCvar.fposition++;
        return fbuffer[ESCvar.fbufposition++];
    }
}

uint16_t FOE_fread(uint8_t *data, uint16_t maxlength)
{
    uint16_t ncopied = 0;

    while (maxlength && (ESCvar.fend - ESCvar.fposition))
    {
        maxlength--;
        *(data) = FOE_fetchbuffer();
        data++;
        ncopied++;
    }

    return ncopied;
}

void FOE_writebuffer(uint8_t data)
{
//    char                 buf[64];

    if(ESCvar.fbufposition < FOE_PAGESIZE)
    {
        ESCvar.fposition++;
        fbuffer[ESCvar.fbufposition++] = data;
    }
    else
    {
        if(!ESCvar.fbufstate)
        {
            m25px0_sector_erase(drv_m25px0_1, ESCvar.fposition - FOE_PAGESIZE);
            while (m25px0_status(drv_m25px0_1) & 0x0001) __nop();
//            terminal_putchar(drv_terminal_1,'+');
//            sprintf(buf,"%i\n\r",ESCvar.fposition);
//            uart8_write(drv_uart8_1,buf,strlen(buf));
        }
        m25px0_program_page(drv_m25px0_1, ESCvar.fposition - FOE_PAGESIZE, &fbuffer[0], FOE_PAGESIZE);
        while (m25px0_status(drv_m25px0_1) & 0x0001) __nop();
//        terminal_putchar(drv_terminal_1,'-');
//        sprintf(buf,"%i\n\r",ESCvar.fbufstate);
//        uart8_write(drv_uart8_1,buf,strlen(buf));

        ESCvar.fbufposition = 0;
//        if(++ESCvar.fbufstate >= PAGESPERBLOCK)
//            ESCvar.fbufstate = 0;
        ESCvar.fbufstate++;
        ESCvar.fposition++;
        fbuffer[ESCvar.fbufposition++] = data;
    }
}

uint16_t FOE_fwrite(uint8_t *data, uint16_t length)
{
    uint16_t ncopied = 0;

    ESCvar.fprevposition = ESCvar.fposition;
    while (length && (ESCvar.fend - ESCvar.fposition))
    {
        length--;
        FOE_writebuffer(*(data));
        data++;
        ncopied++;
    }

    return ncopied;
}

void FOE_fclose(void)
{
    uint16_t cnt;
    cnt = FOE_PAGESIZE;
    while(cnt--)
       FOE_writebuffer(0x00);
}

void FOE_init()
{
    ESCvar.foepacket = 0;
    ESCvar.foestate = FOE_READY;
    ESCvar.fposition = 0;
    ESCvar.fprevposition = 0;
    ESCvar.fbufstate = 0;
    ESCvar.fbufposition = 0;
}

void FOE_abort(uint32_t code)
{
    _FOE *foembx;
    uint8_t mbxhandle;

    if(code)
    {
        /* Send back an error packet. */
        mbxhandle = ESC_claimbuffer();
        if(mbxhandle)
        {
            foembx = (_FOE*)&MBX[mbxhandle];
            foembx->mbxheader.length = htoes(FOEHSIZE); /* Don't bother with error text for now. */
            foembx->mbxheader.mbxtype = MBXFOE;
            foembx->foeheader.opcode = FOE_OP_ERR;
            foembx->foeheader.x.errorcode = htoel(code);
            MBXcontrol[mbxhandle].state = MBXstate_outreq;
        }
        /* Nothing we can do if we can't get an outbound mailbox. */
    }
    FOE_init();
}

/* Sends an FoE data packet out, returning the number of data octets
 * written or an error number.
 * Error numbers will be greater than FOE_DATA_SIZE.*/
uint16_t FOE_send_data_packet()
{
    _FOE     *foembx;
    uint16_t data_len;
    uint8_t  mbxhandle;

    mbxhandle = ESC_claimbuffer();
    if(mbxhandle)
    {
        foembx = (_FOE*)&MBX[mbxhandle];
        data_len = FOE_fread(foembx->y.data, FOE_DATA_SIZE);
        foembx->mbxheader.length = htoes(data_len + FOEHSIZE);
        foembx->mbxheader.mbxtype = MBXFOE;
        foembx->foeheader.opcode = FOE_OP_DATA;
        foembx->foeheader.x.packetnumber = htoel(ESCvar.foepacket);
        /* Mark the outbound mailbox as filled. */
        MBXcontrol[mbxhandle].state = MBXstate_outreq;
        ESCvar.foepacket++;
        return data_len;
    }
    else
        return FOE_ERR_PROGERROR;
}

uint16_t FOE_send_ack()
{
    _FOE    *foembx;
    uint8_t mbxhandle;

    mbxhandle = ESC_claimbuffer();
    if(mbxhandle)
    {
        foembx = (_FOE*)&MBX[mbxhandle];
        foembx->mbxheader.length = htoes(FOEHSIZE);
        foembx->mbxheader.mbxtype = MBXFOE;
        foembx->foeheader.opcode = FOE_OP_ACK;
        foembx->foeheader.x.packetnumber = htoel(ESCvar.foepacket);
        MBXcontrol[mbxhandle].state = MBXstate_outreq;
        ESCvar.foepacket++;
        return 0;
    }
    else
        return FOE_ERR_PROGERROR;
}

/* Handlers for various FoE states. */

void FOE_read()
{
    _FOE *foembx;
    uint16_t data_len;
    uint32_t password;
    uint16_t res;

    if(ESCvar.foestate != FOE_READY)
    {
        FOE_abort(FOE_ERR_ILLEGAL);
        return;
    }

    FOE_init();
    foembx = (_FOE*)&MBX[0];
    //Get the length of the file name in octets.
    data_len = etohs(foembx->mbxheader.length) - FOEHSIZE;
    password = etohl(foembx->foeheader.x.password);

    res = FOE_fopen(foembx->y.filename, data_len, password, FOE_OP_RRQ);
    if(res==0)
    {
        ESCvar.foepacket=1;
        /* Attempt to send the packet */
        res = FOE_send_data_packet();
        if(res <= FOE_DATA_SIZE)
        {
            ESCvar.foestate = FOE_WAIT_FOR_ACK;
        }
        else
            FOE_abort(res);
    }
    else
        FOE_abort(res);
}

void FOE_ack()
{
    uint16_t res;

    // Make sure we're able to take this.
    if(ESCvar.foestate == FOE_WAIT_FOR_FINAL_ACK)
    {
        // Move us back to ready state.
        FOE_init();
        return;
    }
    else if(ESCvar.foestate != FOE_WAIT_FOR_ACK)
    {
        FOE_abort(FOE_ERR_ILLEGAL);
        return;
    }
    res = FOE_send_data_packet();
    if(res < FOE_DATA_SIZE)
    {
        ESCvar.foestate = FOE_WAIT_FOR_FINAL_ACK;
    }
    else if(res >= FOE_ERR_NOTDEFINED)
        FOE_abort(FOE_ERR_PROGERROR);
}

void FOE_write()
{
    _FOE *foembx;
    uint16_t data_len;
    uint32_t password;
    int16_t res;

    if(ESCvar.foestate != FOE_READY)
    {
        FOE_abort(FOE_ERR_ILLEGAL);
        return;
    }

    FOE_init();
    foembx = (_FOE*)&MBX[0];
    data_len = etohs(foembx->mbxheader.length) - FOEHSIZE;
    password = etohl(foembx->foeheader.x.password);

    /* Get an address we can write the file to, if possible. */
    res = FOE_fopen(foembx->y.filename, data_len, password, FOE_OP_WRQ);
    if(res==0)
    {
        res = FOE_send_ack();
        if(res)
            FOE_abort(res);
        else
            ESCvar.foestate = FOE_WAIT_FOR_DATA;
    }
    else
        FOE_abort(res);
}

void FOE_data()
{
    _FOE     *foembx;
    uint32_t packet;
//    uint16_t data_len, ncopied;
    uint16_t data_len;
    int16_t res;

    if(ESCvar.foestate != FOE_WAIT_FOR_DATA)
    {
        FOE_abort(FOE_ERR_ILLEGAL);
        return;
    }

    foembx =(_FOE*)&MBX[0];
    data_len = etohs(foembx->mbxheader.length) - FOEHSIZE;
    packet = etohl(foembx->foeheader.x.packetnumber);
    if(packet != ESCvar.foepacket)
        FOE_abort(FOE_ERR_PACKETNO);
    else if(ESCvar.fposition + data_len > ESCvar.fend)
        FOE_abort(FOE_ERR_DISKFULL);
    else
    {
//        ncopied = FOE_fwrite(foembx->y.data, data_len);
        FOE_fwrite(foembx->y.data, data_len);
        if (foe_mode == FOE_WRITE) res = FOE_send_ack(); else res=0;

        if(data_len == FOE_DATA_SIZE)
        {
            //res = FOE_send_ack();
            if(res) FOE_abort(res);
        }
        else
        {
            FOE_fclose();
            FOE_init();
        }
    }
}

void FOE_busy()
{
    /* Only valid if we're servicing a read request. */
    if(ESCvar.foestate!=FOE_WAIT_FOR_ACK)
        FOE_abort(FOE_ERR_ILLEGAL);
    else
    {
        /* Send the last part again. */
        ESCvar.fposition = ESCvar.fprevposition;
        ESCvar.foepacket--;
        FOE_ack();
    }
}

void FOE_error()
{
    /* Master panic! abort the transfer. */
    FOE_abort(0);
}

void ESC_foeprocess(void)
{
    _MBXh *mbh;
    _FOE *foembx;

    //*leds=32;

    if (!MBXrun)
        return;


    if (!ESCvar.xoe && (MBXcontrol[0].state == MBXstate_inclaim))
    {
        mbh = (_MBXh *)&MBX[0];
        if (mbh->mbxtype == MBXFOE)
            ESCvar.xoe = MBXFOE;
    }

    if (ESCvar.xoe == MBXFOE)
    {
        foembx = (_FOE *)&MBX[0];
        /* Verify the size of the file data. */
        if(etohs(foembx->mbxheader.length) < FOEHSIZE)
            FOE_abort(MBXERR_SIZETOOSHORT);
        else
        {
            switch(foembx->foeheader.opcode)
            {
            case FOE_OP_RRQ:
                foe_mode = FOE_READ;
                FOE_read();
                break;
            case FOE_OP_ACK:
                FOE_ack();
                break;
            case FOE_OP_WRQ:
                foe_mode = FOE_WRITE;
                FOE_write();
                break;
            case FOE_OP_DATA:
                FOE_data();
                break;
            case FOE_OP_BUSY:
                FOE_busy();
                break;
            case FOE_OP_ERR:
                foe_mode = FOE_IDLE;
                FOE_error();
                break;
            default:
                foe_mode = FOE_IDLE;
                FOE_abort(FOE_ERR_NOTDEFINED);
            }
        }
        MBXcontrol[0].state = MBXstate_idle;
        ESCvar.xoe = 0;
    }
}
