Readme - DTMF application

DESCRIPTION: 
This program reads data from a memory mapped keypad decoder hardware module, displays data to the NIOS console, then passes the data to the DTMF tone selector. One feature is only when a new key is pressed will the key data update and the tone is active for 100ms. Unfortunately, this means if the same key is pressed twice it will only sound once. This is an issue with the keypad decoder it saves the last valid keypress on its data out bus. To fix this the keypad decoder should have a default state where it could output some data signifying a key is not being pressed.
