#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"

int main()
{
	unsigned char key = 0x0;
	unsigned short count = 0;
	while(1)
	{
		printf("%i\t", key);

		while(count < 2000) count++;
		key = IORD_ALTERA_AVALON_PIO_DATA(PIO_DATA_BASE);
		count = 0;
	}
	return 0;
}
