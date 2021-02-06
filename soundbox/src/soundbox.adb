with Ada.Text_IO; use Ada.Text_IO;
with Note; use Note;

procedure Soundbox is
   Note : Notes := Asharp;
begin
   Put_Line(NoteToString(Note));
end Soundbox;
