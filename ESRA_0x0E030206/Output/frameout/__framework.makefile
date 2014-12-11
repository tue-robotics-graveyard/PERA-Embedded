#
#	Software Platform Generated File
#	--------------------------------
#


# global makefile strings

# global framework compiler options
OPT_FRAMEWORK += -I"$(SWPLATFORMDIR1)\platform\fpga\drivers\uart8\internal"
OPT_FRAMEWORK += -I"$(SWPLATFORMDIR1)\platform\pal\include"
OPT_FRAMEWORK += -DNDEBUG=1
OPT_FRAMEWORK += -I"$(SWPLATFORMDIR1)\system\init\include"
OPT_FRAMEWORK += -Wc-w508

# build rules to generate framework objects
SSASOBJ += "$(SSASOUTDIR)\drv_m25px0_drv_m25px0.obj"
"$(SSASOUTDIR)\drv_m25px0_drv_m25px0.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\drv_m25px0_drv_m25px0.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\drv_m25px0_drv_m25px0.d"

"$(SSASOUTDIR)\drv_m25px0_drv_m25px0.obj" : "$(SSASOUTDIR)\drv_m25px0_drv_m25px0.obj.opt"
	@echo Building drv_m25px0 plugin
	"$(CC)" -c  "$(SWPLATFORMDIR1)\platform\external\drivers\m25px0\src\drv_m25px0.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\drv_m25px0_drv_m25px0.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\drv_m25px0_drv_m25px0_cfg_instance.obj"
"$(SSASOUTDIR)\drv_m25px0_drv_m25px0_cfg_instance.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\drv_m25px0_drv_m25px0_cfg_instance.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\drv_m25px0_drv_m25px0_cfg_instance.d"

"$(SSASOUTDIR)\drv_m25px0_drv_m25px0_cfg_instance.obj" : "$(SSASOUTDIR)\drv_m25px0_drv_m25px0_cfg_instance.obj.opt"
	"$(CC)" -c  "$(SSASCFGDIR)\drv_m25px0_cfg_instance.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\drv_m25px0_drv_m25px0_cfg_instance.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\drv_pwmx_drv_pwmx.obj"
"$(SSASOUTDIR)\drv_pwmx_drv_pwmx.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\drv_pwmx_drv_pwmx.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\drv_pwmx_drv_pwmx.d"

"$(SSASOUTDIR)\drv_pwmx_drv_pwmx.obj" : "$(SSASOUTDIR)\drv_pwmx_drv_pwmx.obj.opt"
	@echo Building drv_pwmx plugin
	"$(CC)" -c  "$(SWPLATFORMDIR1)\platform\fpga\drivers\pwmx\src\drv_pwmx.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\drv_pwmx_drv_pwmx.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\drv_pwmx_drv_pwmx_cfg_instance.obj"
"$(SSASOUTDIR)\drv_pwmx_drv_pwmx_cfg_instance.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\drv_pwmx_drv_pwmx_cfg_instance.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\drv_pwmx_drv_pwmx_cfg_instance.d"

"$(SSASOUTDIR)\drv_pwmx_drv_pwmx_cfg_instance.obj" : "$(SSASOUTDIR)\drv_pwmx_drv_pwmx_cfg_instance.obj.opt"
	"$(CC)" -c  "$(SSASCFGDIR)\drv_pwmx_cfg_instance.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\drv_pwmx_drv_pwmx_cfg_instance.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\drv_spi_drv_spi.obj"
"$(SSASOUTDIR)\drv_spi_drv_spi.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\drv_spi_drv_spi.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\drv_spi_drv_spi.d"

"$(SSASOUTDIR)\drv_spi_drv_spi.obj" : "$(SSASOUTDIR)\drv_spi_drv_spi.obj.opt"
	@echo Building drv_spi plugin
	"$(CC)" -c  "$(SWPLATFORMDIR1)\platform\fpga\drivers\spi\src\drv_spi.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\drv_spi_drv_spi.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\drv_spi_drv_spi_cfg_instance.obj"
"$(SSASOUTDIR)\drv_spi_drv_spi_cfg_instance.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\drv_spi_drv_spi_cfg_instance.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\drv_spi_drv_spi_cfg_instance.d"

"$(SSASOUTDIR)\drv_spi_drv_spi_cfg_instance.obj" : "$(SSASOUTDIR)\drv_spi_drv_spi_cfg_instance.obj.opt"
	"$(CC)" -c  "$(SSASCFGDIR)\drv_spi_cfg_instance.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\drv_spi_drv_spi_cfg_instance.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\drv_uart8_drv_uart8.obj"
"$(SSASOUTDIR)\drv_uart8_drv_uart8.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\drv_uart8_drv_uart8.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\drv_uart8_drv_uart8.d"

"$(SSASOUTDIR)\drv_uart8_drv_uart8.obj" : "$(SSASOUTDIR)\drv_uart8_drv_uart8.obj.opt"
	@echo Building drv_uart8 plugin
	"$(CC)" -c  "$(SWPLATFORMDIR1)\platform\fpga\drivers\uart8\src\drv_uart8.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\drv_uart8_drv_uart8.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\drv_uart8_drv_uart8_internal.obj"
"$(SSASOUTDIR)\drv_uart8_drv_uart8_internal.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\drv_uart8_drv_uart8_internal.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\drv_uart8_drv_uart8_internal.d"

"$(SSASOUTDIR)\drv_uart8_drv_uart8_internal.obj" : "$(SSASOUTDIR)\drv_uart8_drv_uart8_internal.obj.opt"
	"$(CC)" -c  "$(SWPLATFORMDIR1)\platform\fpga\drivers\uart8\src\drv_uart8_internal.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\drv_uart8_drv_uart8_internal.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\drv_uart8_drv_uart8_interrupts.obj"
"$(SSASOUTDIR)\drv_uart8_drv_uart8_interrupts.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\drv_uart8_drv_uart8_interrupts.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\drv_uart8_drv_uart8_interrupts.d"

"$(SSASOUTDIR)\drv_uart8_drv_uart8_interrupts.obj" : "$(SSASOUTDIR)\drv_uart8_drv_uart8_interrupts.obj.opt"
	"$(CC)" -c  "$(SWPLATFORMDIR1)\platform\fpga\drivers\uart8\src\drv_uart8_interrupts.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\drv_uart8_drv_uart8_interrupts.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\drv_uart8_drv_uart8_cfg_instance.obj"
"$(SSASOUTDIR)\drv_uart8_drv_uart8_cfg_instance.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\drv_uart8_drv_uart8_cfg_instance.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\drv_uart8_drv_uart8_cfg_instance.d"

"$(SSASOUTDIR)\drv_uart8_drv_uart8_cfg_instance.obj" : "$(SSASOUTDIR)\drv_uart8_drv_uart8_cfg_instance.obj.opt"
	"$(CC)" -c  "$(SSASCFGDIR)\drv_uart8_cfg_instance.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\drv_uart8_drv_uart8_cfg_instance.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\per_ioport_per_ioport.obj"
"$(SSASOUTDIR)\per_ioport_per_ioport.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\per_ioport_per_ioport.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\per_ioport_per_ioport.d"

"$(SSASOUTDIR)\per_ioport_per_ioport.obj" : "$(SSASOUTDIR)\per_ioport_per_ioport.obj.opt"
	@echo Building per_ioport plugin
	"$(CC)" -c  "$(SWPLATFORMDIR1)\platform\fpga\peripherals\ioport\src\per_ioport.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\per_ioport_per_ioport.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\per_ioport_per_ioport_cfg_instance.obj"
"$(SSASOUTDIR)\per_ioport_per_ioport_cfg_instance.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\per_ioport_per_ioport_cfg_instance.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\per_ioport_per_ioport_cfg_instance.d"

"$(SSASOUTDIR)\per_ioport_per_ioport_cfg_instance.obj" : "$(SSASOUTDIR)\per_ioport_per_ioport_cfg_instance.obj.opt"
	"$(CC)" -c  "$(SSASCFGDIR)\per_ioport_cfg_instance.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\per_ioport_per_ioport_cfg_instance.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\per_ioport_ioport.obj"
"$(SSASOUTDIR)\per_ioport_ioport.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\per_ioport_ioport.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\per_ioport_ioport.d"

"$(SSASOUTDIR)\per_ioport_ioport.obj" : "$(SSASOUTDIR)\per_ioport_ioport.obj.opt"
	"$(CC)" -c  "$(SSASCFGDIR)\ioport.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\per_ioport_ioport.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\per_pwmx_per_pwmx_cfg_instance.obj"
"$(SSASOUTDIR)\per_pwmx_per_pwmx_cfg_instance.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\per_pwmx_per_pwmx_cfg_instance.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\per_pwmx_per_pwmx_cfg_instance.d"

"$(SSASOUTDIR)\per_pwmx_per_pwmx_cfg_instance.obj" : "$(SSASOUTDIR)\per_pwmx_per_pwmx_cfg_instance.obj.opt"
	@echo Building per_pwmx plugin
	"$(CC)" -c  "$(SSASCFGDIR)\per_pwmx_cfg_instance.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\per_pwmx_per_pwmx_cfg_instance.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\per_spi_per_spi_cfg_instance.obj"
"$(SSASOUTDIR)\per_spi_per_spi_cfg_instance.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\per_spi_per_spi_cfg_instance.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\per_spi_per_spi_cfg_instance.d"

"$(SSASOUTDIR)\per_spi_per_spi_cfg_instance.obj" : "$(SSASOUTDIR)\per_spi_per_spi_cfg_instance.obj.opt"
	@echo Building per_spi plugin
	"$(CC)" -c  "$(SSASCFGDIR)\per_spi_cfg_instance.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\per_spi_per_spi_cfg_instance.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\per_uart8_per_uart8_cfg_instance.obj"
"$(SSASOUTDIR)\per_uart8_per_uart8_cfg_instance.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\per_uart8_per_uart8_cfg_instance.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\per_uart8_per_uart8_cfg_instance.d"

"$(SSASOUTDIR)\per_uart8_per_uart8_cfg_instance.obj" : "$(SSASOUTDIR)\per_uart8_per_uart8_cfg_instance.obj.opt"
	@echo Building per_uart8 plugin
	"$(CC)" -c  "$(SSASCFGDIR)\per_uart8_cfg_instance.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\per_uart8_per_uart8_cfg_instance.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\per_wb_interface_per_wb_interface_cfg_instance.obj"
"$(SSASOUTDIR)\per_wb_interface_per_wb_interface_cfg_instance.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\per_wb_interface_per_wb_interface_cfg_instance.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\per_wb_interface_per_wb_interface_cfg_instance.d"

"$(SSASOUTDIR)\per_wb_interface_per_wb_interface_cfg_instance.obj" : "$(SSASOUTDIR)\per_wb_interface_per_wb_interface_cfg_instance.obj.opt"
	@echo Building per_wb_interface plugin
	"$(CC)" -c  "$(SSASCFGDIR)\per_wb_interface_cfg_instance.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\per_wb_interface_per_wb_interface_cfg_instance.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\per_wb_interface_wb_interfaces.obj"
"$(SSASOUTDIR)\per_wb_interface_wb_interfaces.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\per_wb_interface_wb_interfaces.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\per_wb_interface_wb_interfaces.d"

"$(SSASOUTDIR)\per_wb_interface_wb_interfaces.obj" : "$(SSASOUTDIR)\per_wb_interface_wb_interfaces.obj.opt"
	"$(CC)" -c  "$(SSASCFGDIR)\wb_interfaces.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\per_wb_interface_wb_interfaces.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\pal_arch_3000_pal_c3000.obj"
"$(SSASOUTDIR)\pal_arch_3000_pal_c3000.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\pal_arch_3000_pal_c3000.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\pal_arch_3000_pal_c3000.d"

"$(SSASOUTDIR)\pal_arch_3000_pal_c3000.obj" : "$(SSASOUTDIR)\pal_arch_3000_pal_c3000.obj.opt"
	@echo Building pal_arch_3000 plugin
	"$(CC)" -c  "$(SWPLATFORMDIR1)\platform\fpga\processors\c3000\src\pal_c3000.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\pal_arch_3000_pal_c3000.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\pal_arch_3000_pal_c3000_interrupts.obj"
"$(SSASOUTDIR)\pal_arch_3000_pal_c3000_interrupts.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\pal_arch_3000_pal_c3000_interrupts.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\pal_arch_3000_pal_c3000_interrupts.d"

"$(SSASOUTDIR)\pal_arch_3000_pal_c3000_interrupts.obj" : "$(SSASOUTDIR)\pal_arch_3000_pal_c3000_interrupts.obj.opt"
	"$(CC)" -c  "$(SWPLATFORMDIR1)\platform\fpga\processors\c3000\src\pal_c3000_interrupts.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\pal_arch_3000_pal_c3000_interrupts.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\pal_arch_3000_pal_c3000_posix.obj"
"$(SSASOUTDIR)\pal_arch_3000_pal_c3000_posix.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\pal_arch_3000_pal_c3000_posix.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\pal_arch_3000_pal_c3000_posix.d"

"$(SSASOUTDIR)\pal_arch_3000_pal_c3000_posix.obj" : "$(SSASOUTDIR)\pal_arch_3000_pal_c3000_posix.obj.opt"
	"$(CC)" -c  "$(SWPLATFORMDIR1)\platform\fpga\processors\c3000\src\pal_c3000_posix.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\pal_arch_3000_pal_c3000_posix.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\pal_pal_init.obj"
"$(SSASOUTDIR)\pal_pal_init.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\pal_pal_init.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\pal_pal_init.d"

"$(SSASOUTDIR)\pal_pal_init.obj" : "$(SSASOUTDIR)\pal_pal_init.obj.opt"
	@echo Building pal plugin
	"$(CC)" -c  "$(SWPLATFORMDIR1)\platform\pal\src\pal_init.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\pal_pal_init.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\pal_pal_timers.obj"
"$(SSASOUTDIR)\pal_pal_timers.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\pal_pal_timers.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\pal_pal_timers.d"

"$(SSASOUTDIR)\pal_pal_timers.obj" : "$(SSASOUTDIR)\pal_pal_timers.obj.opt"
	"$(CC)" -c  "$(SWPLATFORMDIR1)\platform\pal\src\pal_timers.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\pal_pal_timers.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\pal_pal_timing.obj"
"$(SSASOUTDIR)\pal_pal_timing.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\pal_pal_timing.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\pal_pal_timing.d"

"$(SSASOUTDIR)\pal_pal_timing.obj" : "$(SSASOUTDIR)\pal_pal_timing.obj.opt"
	"$(CC)" -c  "$(SWPLATFORMDIR1)\platform\pal\src\pal_timing.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\pal_pal_timing.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\interrupts_interrupts.obj"
"$(SSASOUTDIR)\interrupts_interrupts.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\interrupts_interrupts.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\interrupts_interrupts.d"

"$(SSASOUTDIR)\interrupts_interrupts.obj" : "$(SSASOUTDIR)\interrupts_interrupts.obj.opt"
	@echo Building interrupts plugin
	"$(CC)" -c  "$(SWPLATFORMDIR1)\services\platform\interrupts\src\interrupts.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\interrupts_interrupts.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\timing_timers.obj"
"$(SSASOUTDIR)\timing_timers.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\timing_timers.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\timing_timers.d"

"$(SSASOUTDIR)\timing_timers.obj" : "$(SSASOUTDIR)\timing_timers.obj.opt"
	@echo Building timing plugin
	"$(CC)" -c  "$(SWPLATFORMDIR1)\services\platform\timing\src\timers.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\timing_timers.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\timing_timing.obj"
"$(SSASOUTDIR)\timing_timing.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\timing_timing.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)  $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\timing_timing.d"

"$(SSASOUTDIR)\timing_timing.obj" : "$(SSASOUTDIR)\timing_timing.obj.opt"
	"$(CC)" -c  "$(SWPLATFORMDIR1)\services\platform\timing\src\timing.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\timing_timing.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\ifconfig_swp_ifconfig.obj"
"$(SSASOUTDIR)\ifconfig_swp_ifconfig.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\ifconfig_swp_ifconfig.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)   -I"$(SWPLATFORMDIR1)\system\ifconfig\include" $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\ifconfig_swp_ifconfig.d"

"$(SSASOUTDIR)\ifconfig_swp_ifconfig.obj" : "$(SSASOUTDIR)\ifconfig_swp_ifconfig.obj.opt"
	@echo Building ifconfig plugin
	"$(CC)" -c  "$(SWPLATFORMDIR1)\system\ifconfig\src\swp_ifconfig.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\ifconfig_swp_ifconfig.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\init_init.obj"
"$(SSASOUTDIR)\init_init.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\init_init.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)   -I"$(SWPLATFORMDIR1)\system\init\include" $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\init_init.d"

"$(SSASOUTDIR)\init_init.obj" : "$(SSASOUTDIR)\init_init.obj.opt"
	@echo Building init plugin
	"$(CC)" -c  "$(SWPLATFORMDIR1)\system\init\src\init.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\init_init.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\init___framework_init.obj"
"$(SSASOUTDIR)\init___framework_init.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\init___framework_init.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)   -I"$(SWPLATFORMDIR1)\system\init\include" $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\init___framework_init.d"

"$(SSASOUTDIR)\init___framework_init.obj" : "$(SSASOUTDIR)\init___framework_init.obj.opt"
	"$(CC)" -c  "$(SSASCFGDIR)\__framework_init.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\init___framework_init.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\sysutils_init_memory.obj"
"$(SSASOUTDIR)\sysutils_init_memory.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\sysutils_init_memory.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)   -I"$(SWPLATFORMDIR1)\system\sysutils\include" $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\sysutils_init_memory.d"

"$(SSASOUTDIR)\sysutils_init_memory.obj" : "$(SSASOUTDIR)\sysutils_init_memory.obj.opt"
	@echo Building sysutils plugin
	"$(CC)" -c  "$(SWPLATFORMDIR1)\system\sysutils\src\init_memory.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\sysutils_init_memory.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\sysutils_sysutils.obj"
"$(SSASOUTDIR)\sysutils_sysutils.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\sysutils_sysutils.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)   -I"$(SWPLATFORMDIR1)\system\sysutils\include" $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\sysutils_sysutils.d"

"$(SSASOUTDIR)\sysutils_sysutils.obj" : "$(SSASOUTDIR)\sysutils_sysutils.obj.opt"
	"$(CC)" -c  "$(SWPLATFORMDIR1)\system\sysutils\src\sysutils.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\sysutils_sysutils.obj.opt"

SSASOBJ += "$(SSASOUTDIR)\sysutils_util_string.obj"
"$(SSASOUTDIR)\sysutils_util_string.obj.opt" : $(MAKEFILE)
	@argfile "$(SSASOUTDIR)\sysutils_util_string.obj.opt" $(OPT_ARCH) $(OPT_CPU) $(OPT_CC_SSAS_LITE)   -I"$(SWPLATFORMDIR1)\system\sysutils\include" $(OPT_CC) $(OPT_FRAMEWORK)


-include "$(SSASOUTDIR)\sysutils_util_string.d"

"$(SSASOUTDIR)\sysutils_util_string.obj" : "$(SSASOUTDIR)\sysutils_util_string.obj.opt"
	"$(CC)" -c  "$(SWPLATFORMDIR1)\system\sysutils\src\util_string.c"  -o "$@" --dep-file="$*.d" --make-target="$@" -f "$(SSASOUTDIR)\sysutils_util_string.obj.opt"

