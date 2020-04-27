//NIOS II DC Motor Lab
/*
 * AUTHOR: JAMES STARKS
 * DATE: 4/26/2020
 * FROM: TXST SENIOR DESIGN PROJECT FALL 2019-SPRING 2020
 * FOR: TEXAS STATE UNIVERSITY STUDENTS AND INSTRUCTOR USE
 * DESCRIPTION: DC motor controller lab.
 *
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
	if(y == 0)
	{
		return 1;
	}
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
	while((ch = alt_getchar()) != '\n')
	{
		if(count < max_len)
		{
			str[count++] = ch;
		}
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
alt_u16 strtoi_u16(alt_u8 str[], alt_u8 len)
{
	alt_u16 value = 0;
	alt_u8 y = 0;

	for(alt_8 i = len-1; i >= 0; i--)
	{
		value += (str[i]-48)*pow_u8(10, y);
		y++;
	}
	return value;
}

/*
 * main
 * ----------------
 * Entry point
 *
 * Returns:
 *
 */
int main()
{
	alt_u16 freq;
	alt_u16 div;
	alt_u8  direction;
	alt_u8  new_length;

	// Main program loop
	while(1)
	{
		freq = 0;
		direction = 0;
		div = 0;
		alt_u8 str[5];

		// Prompt user for a frequency
		alt_printf("Enter frequency [0-65535]");
		new_length = gets_u8(str, 5);
		freq = strtoi_u16(str, new_length);

		// The div well be written to the variable_stepdown.v module, which
		// expect a uint16 to divde the clock by. The input clock to the
		// variable_stepdown.v module is 1MHz. Look into that module to
		// see how the frequency is dropped by the division constant.
		div = 500000/freq;

		// Same as above, but for direction.
		alt_printf("Enter direction [1-0(1-Counterclockwise, 0 Clockwise)]");
		new_length = gets_u8(str,1);
		direction = strtoi_u16(str, new_length);

		// Write to division constant and direction modules to control the motor.
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_DIVISION_BASE, div);
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_DIRECTION_BASE, direction);

		// Print out the settings applied to the motor controller modules
		// Requested Freq - Requested frequency as entered by the user.
		// Actual Freq - Due to truncation in integer division, actual
		// 				 freq maybe different. This uint16 is then piped
		// 				 to variable_stepdown.v module.
		// Direction - Set the direction in the direction.v module
		alt_printf("\n--------Applied Settings--------");
		alt_printf("\nRequested Freq: 0x%x", freq);
		alt_printf("\nActual Freq: 0x%x", (500000/div));
		alt_printf("\nDirection: %x", direction);
		alt_printf("\n--------------------------------\n\n");

	}

	return 0;
}
