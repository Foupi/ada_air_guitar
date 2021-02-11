with Ada.Streams; use Ada.Streams;
with GNAT.Serial_Communications; use GNAT.Serial_Communications;

with Note; use Note;

package Serial is

   procedure SerialSetup;
   
   function SerialReceiveNote return Notes;
   --  Receives one byte from the internal port and translates it into a note.
   
private

   Receiver      : aliased Serial_Port;
   --  Internal Serial port.
   
   function ByteToNote (Byte : Stream_Element) return Notes;
   --  Translates a byte into a Note.

end Serial;
