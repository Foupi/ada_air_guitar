with Ada.Text_IO; use Ada.Text_IO;

with Note;   use Note;
with Serial; use Serial;

procedure Soundbox is
   Note : Notes;
begin
   SerialSetup;

   loop
      Note := SerialReceiveNote;

      Put_Line(NoteToString(Note));
   end loop;
end Soundbox;
