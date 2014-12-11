/*
 *	Software Platform Generated File
 *	--------------------------------
 */

#include <init.h>

void framework_init (void){

	extern void pal_init(void);
	pal_init();

	extern void swplatform_init_stacks(void);
	swplatform_init_stacks();

}

