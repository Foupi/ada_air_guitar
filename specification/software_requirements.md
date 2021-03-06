# Software Requirements


This document holds the high-level requirements for this project. These
requirements are split between those of the embedded program and those of the
soundbox program.

## Embedded program


-   1: Until the button is pressed, the program shall stay in an idle state.
-   2: Upon pressing the button, the detection sequence composed of distance
    measuring and note computation and sending shall be initiated.
-   3: A measured distance below 2cm or above 62cm shall be ignored.
-   4: A measured distance between the two values listed above shall be
    considered a note, starting at C (Do) from 2 to 7cm, then increasing by one
    half-tone every 5cm.
-   5: The computed note shall be sent as a single byte through the board's
    UART.
-   6: At the end of the detection sequence, the program shall go back to an
    idle state until the button is pressed again.

## Soundbox program


-   7: Until a byte is received from the board, the program shall stay in an
    idle state.
-   8: Upon receiving a byte, the play sequence, composed of byte translation
    and sound playing shall be initiated.
-   9: The received byte shall be translated as a note.
-   10: Once a note is received, the corresponding frequency shall be played by
    the computer for a duration of 1s (potentially with a fade-out).
-   11: If a note is received while another one is being played, then the note
    being played shall be interrupted and replaced by the newly received one.
-   12: When the event of the note playing for one second is registered, the
    program shall go back to an idle state until another note is received.

## LLR

The low-lever requierments are hold by the Pre and Post conditions.
They are currently only needed for the Sensor class inside the `embeded` subproject as the other functions or code part are hardware linked or I/O linked.
