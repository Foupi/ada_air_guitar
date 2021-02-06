package body Note is
   
   function NoteToString (Note : in Notes) return String is
   begin
      case Note is
         when C => return "Do";
         when Csharp => return "Do#";
         when D => return "Ré";
         when Dsharp => return "Ré#";
         when E => return "Mi";
         when F => return "Fa";
         when Fsharp => return "Fa#";
         when G => return "Sol";
         when Gsharp => return "Sol#";
         when A => return "La";
         when Asharp => return "La#";
         when B => return "Si";
      end case;
   end NoteToString;
   
   function NoteToByte (Note : in Notes) return NoteByte is
   begin
      return 0;
   end NoteToByte;

   function ByteToNote (Byte : in NoteByte) return Notes is
   begin
      return A;
   end ByteToNote;
   
end Note;
