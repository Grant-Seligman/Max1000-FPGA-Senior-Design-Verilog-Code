#include <stdio.h>
#include <sys/wait.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"

int main()
{
	unsigned char key = 0x0;
	unsigned char new_key = 0x0;

	while(1)
	{
		key = IORD_ALTERA_AVALON_PIO_DATA(PIO_KEYPAD_BASE);
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_SEVEN_SEGMENT_BASE, key);

		if(new_key == key) continue;
		else
		{
			new_key = key;
			printf("%i\t", key);
		}
	}
	return 0;
}
