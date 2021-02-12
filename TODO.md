TODO
====

This document presents tasks that are yet to accomplish.

Features
--------

-   Embedded: Add a message prompting to push the button
-   Embedded: Also print the byte sent on the UART
-   Embedded: When a crash occurs, display an error message
-   Soundbox: Fix UART reception
-   Soundbox: Print received note on standard output
-   Soundbox: Emit sound

Specification
-------------

-   Draw a schema for the software architecture
-   Write the low-level requirements
-   Write the trace data
-   Develop pre and post conditions meeting these requirements
-   Write test cases for function that do not use I/O

Refactoring
-----------

-   Shared:     Define a `Byte` type to serialize/deserialize a note
-   Embedded:   Put all sensor GPIO initialization code in a sensor function
