ADA AIR GUITAR - README
=======================

Authors
-------

-   Thomas MICHELOT <thomas.michelot@epita.fr>
-   Pierre FOUCART  <pierre.foucart@epita.fr>

Description
-----------

This project's aim is to reproduce a guitar string using a distance sensor, a
PC and a microcontroller.

Upon pressing the microcontroller's button, the microcontroller shall use the
distance sensor, and send on the UART the note according to the obtained
distance ; upon receiving the note, the PC connected to the microcontroller
shall play the according note.

Hardware
--------

The material used for this project was:

-   A STM32F429I-DISC1 (Discovery) board;
-   An HC-SR04 distance sensor;
-   A breadboard;
-   An USB/USART cable;
-   An USB/Micro-USB cable (used for flashing, but not necessary afterwards);
-   4 to 5 M/F wires (the fifth being used to connect the GND pin of the USART
    cable to that of the board, as it is quite far away from the others);
-   A PC.

Here are the connections that shall be made:

-   HC-SR04 VCC     /   STM32 FIXME
-   HC-SR04 Trig    /   STM32 FIXME
-   HC-SR04 Echo    /   STM32 FIXME
-   HC-SR04 GND     /   STM32 GND

Dependencies
------------

This project was made on Arch Linux, and should work on 
For building this project you will need:

-   GNAT Community 2018 for ARM ELF (<https://www.adacore.com/download>),
    needed by ADL;
-   The `arm-none-eabi` toolchain, needed for building binaries that can be run
    on the board;
-   ST-Link utilities, needed for flashing the created binary on the board.

Build
-----

You must first clone this Git repository:

-   `git clone --recursive git@github.com:Foupi/ada_air_guitar.git`

The `--recursive` option ensures that the submodule linked to the ADA Drivers
Library (<https://github.com/AdaCore/Ada_Drivers_Library>) is cloned as well in
the right place.
Once the repository is cloned, go to the `embedded` folder:

-   `cd ada_air_guitar/embedded`

This directory contains the code that is to be embedded on the microcontroller.
There you can also find a Makefile. The `all` rule builds the `main.bin`
binary, and the `flash` one flashes it on the board using `st-flash`.
If you want the binary built and flashed at the same time, just call the
`flash` rule:

-   `make flash`

Now the program is built and flashed on the board.

Usage
-----

Once the program is flashed on the board, just move your hand or any object
towards or away from the sensor: on the board's screen shall appear the
distance detected and the corresponding note.

The UART connection and sound emission have not yet been implemented.

Clean
-----

If you want to clean everything produced during the build, you can go to the
`embedded` directory and call the `clean` rule of the Makefile:

-   `make clean`

Specification
-------------

The project specification will be available in the `specification` folder, at
the root of this repository.
