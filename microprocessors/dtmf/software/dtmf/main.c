#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"

int main()
{
	// Variables used to capture incoming data
	unsigned char key = 0;
	unsigned char old_key = 0;

	// Main loop
	while(1)
	{
		// Read value at PIO_KEYPAD_BASE address into key variable
		key = IORD_ALTERA_AVALON_PIO_DATA(PIO_KEYPAD_BASE);

		// Write key variable to the DTMF selector address
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_DTMF_BASE, key);

		// Check if new key has bee pressed
		if(old_key == key) continue;
		else
		{
			// Update and print
			old_key = key;
			printf("%i\t", key);
		}
	}

	return 0;
}
