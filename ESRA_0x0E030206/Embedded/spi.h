#ifndef  __SPI_H
#define  __SPI_H

#define NOF_OFFSETS     (4)

#define CMD_RECEIVE     0x02
#define CMD_TRANSMIT    0x03

#define REG_STATUS      0
#define REG_POWER       1
#define REG_SPEED       2
#define REG_SLEEP       3

#define SPI_CSR         BaseSPI+1
#define SPI_CDIV        BaseSPI+2

typedef union U_SPI_REGS T_SPI_REGS;

extern T_SPI_REGS spi_regs[NOF_OFFSETS];

extern void SPI_Init(void);

extern void SetupPorts( void );

#endif  /* __SPI_H */

