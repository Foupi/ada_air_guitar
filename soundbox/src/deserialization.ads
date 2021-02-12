with Ada.Streams; use Ada.Streams;

with Note;        use Note;

package Deserialization is

   First_Note_Index : constant Stream_Element :=
     Stream_Element (Notes'Pos (Notes'First));
   Last_Note_Index  : constant Stream_Element :=
     Stream_Element (Notes'Pos (Notes'Last));
   --  *Sigh* No, "Notes'Range" doesn't work.

   subtype Note_Byte is Stream_Element
   range First_Note_Index .. Last_Note_Index;
   --  Single byte representing a note.

   function Byte_To_Note (Byte : Note_Byte) return Notes;
   --  Translates a byte into a note.

end Deserialization;
