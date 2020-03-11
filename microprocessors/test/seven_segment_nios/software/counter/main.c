#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
int main()

3
{
	unsigned char count = 0x0;
	unsigned int delay;

	while(1)
	{
		printf("%i\t", count);
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_DATA_BASE, count);
		delay = 0;

		while(delay < 24000000)
		{
			delay++;
		}
		delay = 0;


		if(count == 15)
		{
			count = 0;
		}

		count++;
	}
	return 0;
}
