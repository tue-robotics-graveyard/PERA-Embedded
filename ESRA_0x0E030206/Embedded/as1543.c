// adc.c

#include "utypes.h"
#include "spi.h"
#include <drv_spi.h>
#include "as1543.h"

void InitSPIADC(spi_t * adc_ref){
  spi_cs_lo(adc_ref);
  // init at MPXAddr=7;
  spi_transceive8(adc_ref, 0x9F);  // 1001 1111
  spi_transceive8(adc_ref, 0x38);  // 0011 1000

  // 1001 1111 0011 1000          ---      0001 1100 1111 1001

  spi_cs_hi(adc_ref);
}

void Read8ADC(spi_t * adc_ref, uint16 chD[8]){
   uint8 i,j,CtrlH;
   j=7; // ch7 last data from previous conversion
   for (i=0;i<8;i++)
   {
      CtrlH=0x83 | (i<<2); // bWrite | (MPXAddr<<2)| bPM10
      spi_cs_lo(adc_ref);
      chD[j]=spi_transceive16(adc_ref, (CtrlH <<8)+0x38) & 0x0FFF;



      spi_cs_hi(adc_ref);
      j=i;
   }
}
