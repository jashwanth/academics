#include "globals.h"

extern volatile int timeout;

/*****************************************************************************
 * Interval timer interrupt service routine
 *                                                                          
 * Shifts a PATTERN being displayed on the HEX displays. The shift direction 
 * is determined by the external variable KEY_PRESSED.
 * 
******************************************************************************/
void interval_timer_ISR(struct alt_up_dev * up_dev, unsigned int id)
{
	volatile int * interval_timer_ptr = (int *) 0x10002000;

	*(interval_timer_ptr) = 0; 										// clear the interrupt
	timeout = 1;															// set global variable

	return;
}

