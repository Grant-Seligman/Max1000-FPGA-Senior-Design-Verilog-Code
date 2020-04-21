//NIO II C Program Simple Data Allocation
/*
 * AUTHOR: JAMES STARKS
 * DATE:
 * FROM: TXST SENIOR DESIGN PROJECT FALL 2019-SPRING 2020
 * FOR: TEXAS STATE UNIVERSITY STUDENTS AND INSTRUCTOR USE
*/

/*
 * This simple program reads the input pins from the keypad and then writes
 * this input into an address in NIOS'system memory register.
 * Then NIOS will write this value from memory out to the
 * seven segment decoder module. Where it will send the output
 * to the pins that you assigned.
*/
//including the libraries needed for the project to run
#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"

int main()
{
  // Variables used to capture incoming data
	unsigned char key = 0;
	unsigned char old_key = 0;

  // Main loop to check for keypad input
  while (1)
  {
	  // Read value at PIO_KEYPAD_BASE address into key variable
	  key = IORD_ALTERA_AVALON_PIO_DATA(PIO_KEYPAD_BASE);

	  /*Instead of PIO_KEYPAD_BASE, you could input the exact address value
	   *You will find this 0x_______ address in the Platform Designer under
	   *the Base column.
	   *Example: key = IORD_ALTERA_AVALON_PIO_DATA(0x2010);
	  */

	  // Write key variable to PIO_SEGMENT_BASE address
	  IOWR_ALTERA_AVALON_PIO_DATA(PIO_SEVEN_SEGMENT_BASE, key);

	  // Check if new key has been pressed
	  if(old_key == key) continue;
	  else
	  {
		  // Update the key value and print it to the Console
		  old_key = key;
		  printf("%i\t", key);
	  }
  }

  return 0;
}
