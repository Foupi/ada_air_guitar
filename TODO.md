TODO
====

This document presents tasks that are yet to accomplish.

Features
--------

-   Soundbox: Fix UART reception
-   Soundbox: Emit sound

Specification
-------------

-   Draw a schema for the software architecture
-   Write the low-level requirements
-   Write the trace data
-   Develop pre and post conditions meeting these requirements
-   Write test cases for function that do not use I/O

Debug
-----

-   Embedded: When a crash occurs, display an error message

Refactoring
-----------

-   All:        Write everythng according to the ADA coding style (underscores
                + camel-case...)
-   Embedded:   Put all sensor GPIO initialization code in a sensor function
-   Embedded:   Have functions return an error status instead of just crashing?
