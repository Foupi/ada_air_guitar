with Ada.Text_IO;     use Ada.Text_IO;
with Ada.Streams; use Ada.Streams;

with Deserialization; use Deserialization;
with Note;            use Note;
with Serial;          use Serial;

procedure Soundbox is
   Current_Byte : Byte;
   Note         : Notes;
begin
   SerialSetup;

   loop
      Put_Line("Waiting for byte reception!");

      Current_Byte := Serial_Receive_Byte;
      Put_Line("Received byte: " & Current_Byte'Image);

      if Current_Byte = Reset_Byte then
         Put_Line ("Board was reset!");
      else
         Note := Byte_To_Note(Current_Byte);
         Put_Line("Note: " & NoteToString(Note));
      end if;
   end loop;

end Soundbox;
