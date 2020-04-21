//NIO II C Program Simple Data Allocation
/*
 * AUTHOR: JAMES STARKS
 * DATE: 4/20/2020
 * FROM: TXST SENIOR DESIGN PROJECT FALL 2019-SPRING 2020
 * FOR: TEXAS STATE UNIVERSITY STUDENTS AND INSTRUCTOR USE
 * DESCRIPTION: Keypad controlled DTMF Lab example.
 */

#include "stdio.h"
#include "unistd.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"

int main()
{
	// Used for storing keypad value
	unsigned char key = 0;
	unsigned char old_key = 0;

	// Program loop
	while(1)
	{
		// Store value in PIO_KEYPAD_BASE address into key variable.
		key = IORD_ALTERA_AVALON_PIO_DATA(PIO_KEYPAD_BASE);

		// Check if a new key has been pressed.
		if(old_key == key) continue;
		else
		{
			// Update and print
			old_key = key;
			printf("%i\t", key);
			// Write key data to DTMF selector module
			IOWR_ALTERA_AVALON_PIO_DATA(PIO_DTMF_SELECT_BASE, key);
			// Enable DTMF module for 100ms.
			IOWR_ALTERA_AVALON_PIO_DATA(PIO_DTMF_ENABLE_BASE, 1);
			usleep(100000);
			IOWR_ALTERA_AVALON_PIO_DATA(PIO_DTMF_ENABLE_BASE, 0);
		}

	}

	return 0;
}
