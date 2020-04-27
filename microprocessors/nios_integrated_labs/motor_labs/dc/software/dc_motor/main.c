//NIOS II DC Motor Lab
/*
 * AUTHOR: JAMES STARKS
 * DATE: 4/26/2020
 * FROM: TXST SENIOR DESIGN PROJECT FALL 2019-SPRING 2020
 * FOR: TEXAS STATE UNIVERSITY STUDENTS AND INSTRUCTOR USE
 * DESCRIPTION: DC motor controller lab.
 *
 * You may notice some of the included subroutines are normally
 * included with with in some of the standard C libraries, but
 * since we are using the the BSP small C libraries, not all
 * functionalities are included.
 *
 * The purpose of this program is to get user input and pipe it
 * to a speed controller and direction controller. These controllers
 * are memory mapped Verilog modules included in the Quartus
 * project.
 *
 */

#include "system.h"
#include "sys/alt_stdio.h"
#include "altera_avalon_pio_regs.h"

/*
 * pow_u8
 * ----------------
 * Computes x to the y using alt_u8 (unsigned chars).
 *
 * x: Base
 * y: Exponent
 *
 * Returns: x^y as uint8
 *
 */
alt_u8 pow_u8(alt_u8 x, alt_u8 y)
{
	// Anything to the 0 is 1
	if(y == 0)
	{
		return 1;
	}
	// Loop y-1 times because we start at 0
	else
	{
		alt_u8 value = x;
		for(int i = 0; i < y-1; i++)
		{
			value = value * x;
		}
		return value;
	}
}

/*
 * gets_u8
 * ----------------
 * Use the alt_getchar() subroutine to get max_len
 * characters and store into u8 array.
 *
 * str: Input alt_u8 array
 * max_len: Max acceptable length for str
 *
 * Returns: If less than max_len characters were
 * 			entered, return the count.
 *
 */
alt_u8 gets_u8(alt_u8 str[], alt_u8 max_len)
{
	alt_u8 ch;
	alt_u8 count = 0;
	// Read input buffer until '\n'
	while((ch = alt_getchar()) != '\n')
	{
		// Add input character until max characters reached
		if(count < max_len)
		{
			str[count++] = ch;
		}
		// Add null terminator at the end
		str[count] = '\0';
	}
	return count;
}

/*
 * strtoi_u8
 * ----------------
 * Convert char array into alt_u8,
 *
 * str: Input alt_u8 array
 * len: Length of input array (We could have looped
 * 		till the null terminator, but knowing the len is
 * 		important when knowing which sig fig wer're on.
 *
 * Returns: alt_u8 value of input string.
 *
 */
alt_u8 strtoi_u8(alt_u8 str[], alt_u8 len)
{
	alt_u8 value = 0;
	alt_u8 y = 0;
	// Start for the top of the array (least significant value)
	// and work down.
	for(alt_8 i = len-1; i >= 0; i--)
	{
	   /* Rebase the ASCII value so it becomes an int with str[i]-48.
		*
		* Pow_u8 is used to scale the significant figures, y is used
		* to keep track of which sig fig index the loop's on.
		*/
		value += (str[i]-48)*pow_u8(10, y);
		y++;
	}
	return value;
}

/*
 * main
 *
 * Entry point
 *
 * Returns:
 *
 */
int main()
{
	alt_u8 speed;
	alt_u8 direction;
	alt_u8 new_length;

	// Main program loop
	while(1)
	{
		speed = 0;
		direction = 0;
		// Allocate character array of length 3.
		alt_u8 str[3];

		// Prompt the user to enter decimal integer between 0 and 255.
		alt_printf("Enter speed[0-255(0-fully off, 255-fully on)]");
		// Call gets_u8 passing max_len value of 3 because there's only 3 sig figs in 255.
		new_length = gets_u8(str, 3);
		// Convert user input from ASCII into uint8.
		speed = strtoi_u8(str, new_length);

		// Same as above, but for direction.
		alt_printf("Enter direction [1-0(1-Counterclockwise, 0 Clockwise)]");
		new_length = gets_u8(str,1);
		direction = strtoi_u8(str, new_length);

		// Write to speed and direction modules to control the motor.
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_SPEED_BASE, speed);
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_DIRECTION_BASE, direction);

		// Print out the settings applied to the motor controller modules
		// Speed - Set PWM duty cycle in the speed_controller.v module
		// Direction - Set the direction in the direction.v module
		alt_printf("\n--------Applied Settings--------");
		alt_printf("\nSpeed: 0x%x", speed);
		alt_printf("\nDirection: %x", direction);
		alt_printf("\n--------------------------------\n\n");

	}

	return 0;
}
