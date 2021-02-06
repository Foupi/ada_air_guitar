with System.Storage_Elements;

package Note is

   -- A music note
   type Notes is (C, Csharp, D, Dsharp, E, F, Fsharp, G, Gsharp, A, Asharp, B);
   
   -- Range of values for a serialized note.
   subtype NoteByte is System.Storage_Elements.Storage_Element range 0 .. 11;

   -- Translate the given note to a byte.
   function NoteToByte (Note : in Notes) return NoteByte;

   -- Translate the given byte to a note.
   function ByteToNote (Byte : in NoteByte) return Notes;

   -- Translates the given note to a string.
   function NoteToString (Note : in Notes) return String;

end Note;
