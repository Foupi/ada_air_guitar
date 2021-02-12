with HAL; use HAL;

with Note; use Note;

package Serialization is

   First_Note_Index : constant UInt8 := UInt8 (Notes'Pos (Notes'First));
   Last_Note_Index  : constant UInt8 := UInt8 (Notes'Pos (Notes'Last));
   --  *Sigh* No, "Notes'Range" doesn't work.

   subtype Note_Byte is UInt8 range First_Note_Index .. Last_Note_Index;
   --  Single byte representing a note.

   function Note_To_Byte (Note : Notes) return Note_Byte;
   --  Translates a note into a single byte.

end Serialization;
