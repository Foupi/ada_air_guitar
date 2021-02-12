ADA AIR GUITAR
==============

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
-   4 to 5 M/F wires (the fifth being used to connect the `GND` pin of the
    USART cable to that of the board, as it is quite far away from the others);
-   A PC.

Here are the connections that shall be made:

-   HC-SR04 `VCC`   /   STM32 `5V`
-   HC-SR04 `Trig`  /   STM32 `PE6`
-   HC-SR04 `Echo`  /   STM32 `PE4`
-   HC-SR04 `GND`   /   STM32 `GND`

Dependencies
------------

This project was made on Arch Linux, and should work on any operating system.
For building this project you will need:

-   The GNAT toolchain for the PC program;
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
Once the repository is cloned, enter it:

-   `cd ada_air_guitar`

At the root of the repository, there is a Makefile, which defines an `all`
rule, which creates both the binary that shall be flashed on the board and the
one that shall be run from the PC ; and a `flash` rule, which flashes the
embedded binary on the board.

Therefore, you can first run the `all` rule, in order to create both binaries:

-   `make all`

You can then run the `flash` rule to flash the embedded binary on the board:

-   `make flash`

Now the embedded program is built and flashed on the board: you can hit the
`RESET` button of the board to start it.

Finally, you can run the soundbox binary, which was copied at the root of the
repository by the rule `all`:

-   `./soundbox.elf`

Usage
-----

Once the program is flashed on the board, just put your hand or any object
in front of the sensor, at a distance greater than 2cm: on the board's screen
shall appear the distance detected and the corresponding note (or a message
stating that the note you tried to play does not exist), the latter being sent
on the UART.

Upon receiving the note from its connection from the board's UART, the PC
program shall print on the standard output the note it received.

Sound emission by the PC has not yet been implemented.

Clean
-----

If you want to clean everything produced during the build, you can go to the
root of the repository and call the `clean` rule of the Makefile:

-   `make clean`

It shall remove any file built in the `embedded` and `soundbox` folders, and
erase the `soundbox.elf` binary if it was copied at the root of the repository.

Specification
-------------

The project specification will be available in the `specification` folder, at
the root of this repository.

The specification currently holds:

-   The software requirements data, holding the high-level requirements;
-   A description of the software architecture;
-   Links towards the developed source code.

In the future, it shall hold:

-   The design description, holding the low-level requirements;
-   The trace data, holding the links between HLRs, LLRs and elements of the
    architecture;
-   The test cases for functions that could easily be tested (those not
    involving I/O).
