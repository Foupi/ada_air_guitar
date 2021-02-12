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

The `NoteToString` function allows translation of a `Notes` to a `String`.

Embedded
--------

A `Distance` type is defined as a range of 1-digit mantiss `Float` from `2.0`
to `400.0`, corresponding to the distances the HC-SR04 sensor can measure.

A `DistanceToNote` function allows translation of a `Distance` into a `Notes`.

The embedded codebase defines a `Sonar` record representing the HC-SR04 sensor.
It is instanciated using identifiers of the board's GPIOs connected to the
sensor's `Trigger` and `Echo` pins, and defines a `GetDistance` method which
returns an `Integer` representing the distance in centimeters detected by the
sensor.

The `UARTSendNote` function sends the given note on the given UART TX pin.

The `Main` loop waits for a button press, stores the result of `GetDistance`,
computes and stores the corresponding note using `DistanceToNote`, then calls
`UARTSendNote` on this note.

Soundbox
--------

The `SerialRecvNote` function blocks until receiving one single byte from
the channel connected to the board's UART.

The `PollFrequency` function shall poll a soundwave at the given frequency on
the audio stream for a duration of one second.

The `Main` loop calls `SerialRecvNote` and stores its result, then shall
compute the corresponding frequency using `NoteToFrequency`, then call
`PollFrequency` on the result.
