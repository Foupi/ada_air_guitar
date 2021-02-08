Software Architecture
=====================

This document describes the software architecture of the project. It is split
between what is used by both the embedded and soundbox programs, and then the
specific parts of each program.

In the future, a schema shall be drawn to visually convey the flow of the
architecture.

Shared
------

As notes shall be communicated between both programs, a common type is defined:
the `Notes` type is an enumerated type, holding all the possible values a note
produced by our program can have.

A small API allows translation of a `Notes` to a single byte, to a `String` and
to a `Float` frequency, and the translation of an `Integer` or of a single byte
to a `Notes`.

Embedded
--------

The embedded codebase defines a class for the HC-SR04 sensor. It is
instanciated using identifiers of the board's GPIOs connected to the sensor's
`Trigger` and `Echo` pins, and defines a `GetDistance` method which returns an
`Integer` representing the distance in centimeters detected by the sensor.

The `WaitButton` function shall block until a button press is detected.

The `UARTSendByte` function shall send the given byte on the given UART TX pin.

The `Main` loop shall call `WaitButton`, store the result of `GetDistance`,
compute and store the corresponding note using `DistToNote`, then serialize
this note in a byte using `NoteToByte`, and call `UARTSendByte` on this byte.

Soundbox
--------

The `SerialRecvByte` function shall block until receiving one single byte from
the channel connected to the board's UART.

The `PollFrequency` function shall poll a soundwave at the given frequency on
the audio stream for a duration of one second.

The `Main` loop shall call `SerialRecvByte` and store its result, then call
`ByteToNote` on it and store the result, then compute the corresponding
frequency using `NoteToFrequency`, then call `PollFrequency` on the result.
