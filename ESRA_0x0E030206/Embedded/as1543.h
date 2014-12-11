/*

Definition file for ADC

*/


#ifndef __ADC_H
#define __ADC_H

// PIC18F452 pinning SSP: C3=SCLK, C4=SDI, C5=SDO (werkt max OK met 5MHz SCLK: 20/4=5MHz)
//#define pCSN PIN_C0     // chip select
//#define pVdrive PIN_C1  // IO always 5V

//AS1543 12bit control word, used in 2 8bit bytes (16bit) for SSP
// high order control byte
#define bWrite 0x80     //7H 15        (12)
#define bSeq   0x40     //6H 14        (11)
#define bADDR  0x00     //5..2H 13..10 (10..7) 4bit
#define bPM10  0x03     //1..0H 9..8   (6..5) 2bit
// low order control byte
#define bShadow   0x80   //7L           (4)
#define bWeak     0x40   //6L           (3)
#define bRange    0x20   //5L           (2)
#define bcoding   0x10   //4L           (1)
#define bSE       0x08   //3L           (0)
#define bDummy    0x07   //2..0L        (-1..-3) 3 bit

extern void InitSPIADC(spi_t * adc_ref);
extern void Read8ADC(spi_t * adc_ref, uint16 chD[8]);

#endif   // __ADC_H

