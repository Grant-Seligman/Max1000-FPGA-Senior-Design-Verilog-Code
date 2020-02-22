# Max1000-FPGA-Senior-Design-Verilog-Code
All Verilog & C files for Fall2019 - Spring2020 FPGA/Verilog Texas State University's Capstone Project. Creating FPGA examples for future students using the Arrow Max1000.
## Getting Started
- Useful Links:
    - [Max10](https://www.intel.com/content/www/us/en/products/programmable/fpga/max-10.html)
    - [Arrow Max1000](https://www.arrow.com/en/products/max1000/arrow-development-tools)
    - [Driver Instructions](https://wiki.trenz-electronic.de/display/PD/Arrow+USB+Programmer#ArrowUSBProgrammer-JTAGFrequency)
    - [User Guide](https://www.trenz-electronic.de/fileadmin/docs/Trenz_Electronic/Modules_and_Module_Carriers/2.5x6.15/TEI0001/User_Guide/MAX1000%20User%20Guide.pdf)
    - [Quartus Prime Lite 18.1](https://fpgasoftware.intel.com/18.1/?edition=lite&platform=windows)
    - [NIOS Tutorial](https://www.youtube.com/channel/UCm40WZ1monGP4LGG0RSyvLA/videos)
    - [Demo Project that comes shipped on Max1000](https://shop.trenz-electronic.de/en/Download/?path=Trenz_Electronic/Modules_and_Module_Carriers/2.5x6.15/TEI0001/Reference_Design)
(This is good if you want examples on how to integrate custom HDL modules into a NIOS based system)
- Setup Steps
    1. Download and install Quartus Prime Lite w/ MAX 10 FPGA device support package.
    2. Download and install Arrow USB Programmer Drivers
    3. Start using Quartus!
## Development Pitfalls
These are embarrassing, but in case someone like me is just starting out with no prior experience with FPGAs, this might help getting started with the Max1000.
1. MAKE SURE YOUR USB CABLE ISN'T JUST 5V & GND. I was using this crappy charging cable and scratched my head longer than I'd like to admit.
2. If you're using a few of the onboard LEDs and some of the LEDs are receiving phantom power (the unused LEDs are dim). To fix this go to "Assignment>Device>Device and Pin Options>Unused Pins>Reserve all unused pins"and change the drop down to "As input tri-stated."
4. When using NIOS you may get memory initialization errors during Quartus compilation, navigate to "Assignment>Device>Device and Pin Options>Configuration>Configuration>Configuration mode" and change the drop down to "Single Uncompressed Image with Memory Initialization."
3. Before you can download an elf application file from Eclipse to NIOS, you must change the JTAG TCK. Intel UART JTAG IP input    clock needs to be at least double (2x) the operating frequency of JTAG TCK on board. For instruction on how to set the JTAG TCK navigate to C:\intelFPGA_lite\17.0\nios2eds and run the Nios II Command Shell.bat then execute 
    * ``jtagconfig --setparam <cable number> JtagClock <frequency><unit prefix>`` 
    
    To get cable number... 

    * ``jtagconfig -n``

**Hopefully this helps you get started!!!**
