with System.Storage_Elements;

package Note is

   type Notes is
     (C, Csharp, D, Dsharp, E, F, Fsharp, G, Gsharp, A, Asharp, B, Nothing);
   --  A music note

   subtype NoteByte is System.Storage_Elements.Storage_Element range 0 .. 11;
   --  Range of values for a serialized note.

   function NoteToByte (Note : Notes) return NoteByte;
   --  Translate the given note to a byte.

   function ByteToNote (Byte : NoteByte) return Notes;
   --  Translates the given byte to a note.

   function IntegerToNote (Int : Integer) return Notes;
   --  Translates the given Integer to a note.

   function NoteToString (Note : Notes) return String;
   --  Translates the given note to a string.

end Note;
