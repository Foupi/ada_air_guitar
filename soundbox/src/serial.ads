with Ada.Streams;                use Ada.Streams;
with GNAT.Serial_Communications; use GNAT.Serial_Communications;

with Deserialization;            use Deserialization;

package Serial is

   Reset_Byte : constant Byte := 255;
   --  Byte sent by the board on reset.
   
   procedure SerialSetup;
   --  Sets up the serial port.
   
   function Serial_Receive_Byte return Byte;
   --  Receives one byte from the internal port.

private

   Receiver : aliased Serial_Port;
   --  Internal Serial port.

end Serial;
