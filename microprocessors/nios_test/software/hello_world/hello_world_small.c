#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
int main()
{
	int count = 0;
	int delay;
	printf("Hello from Nios II!\n");

	while(1)
	{
		IOWR_ALTERA_AVALON_PIO_DATA(LEDS_BASE, count & 0xFF);
		delay = 0;

		while(delay < 80000)
		{
			delay++;
		}
		count++;
		printf("%i\t", count);

		if(count == 255)
		{
			count = 0;
			printf("reset\n");
		}
	}
	return 0;
}
