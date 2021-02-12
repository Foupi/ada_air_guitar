with Ada.Streams; use Ada.Streams;
with GNAT.Serial_Communications; use GNAT.Serial_Communications;

package Serial is

   procedure SerialSetup;
   
   function Serial_Receive_Byte return Stream_Element;
   --  Receives one byte from the internal port.

private

   Receiver      : aliased Serial_Port;
   --  Internal Serial port.

end Serial;
