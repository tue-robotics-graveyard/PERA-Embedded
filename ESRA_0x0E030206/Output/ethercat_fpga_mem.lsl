#include "ethercat_fpga.lsl"
#ifdef __SW_LSL
#include __SW_LSL
#endif

derivative system
{
    core sw
    {
        architecture = __SW_ARCH;
    }

    memory MCU
    {
        mau = 8;
        type = blockram;
        size = 65536;
        map(dest=bus:sw:addr_bus, src_offset=0x0, dest_offset=0x0, size=65536);
    }



    // Software Platform locate rules
    #ifdef __SWPLATFORM__
    #include "framecfg\swplatform.lsl"
    #endif















}
