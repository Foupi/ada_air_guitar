with Ada.Text_IO;     use Ada.Text_IO;
with Ada.Streams; use Ada.Streams;

with Deserialization; use Deserialization;
with Note;            use Note;
with Serial;          use Serial;

procedure Soundbox is
   Byte : Stream_Element;
   Note : Notes;
begin
   SerialSetup;

   loop
      Put_Line("Waiting for byte reception!");

      Byte := Serial_Receive_Byte;
      Put_Line("Received byte: " & Byte'Image);

      Note := Byte_To_Note(Byte);
      Put_Line("Note: " & NoteToString(Note));
   end loop;
end Soundbox;
