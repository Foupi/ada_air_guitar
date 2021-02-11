package body Note is

   function NoteToString (Note : Notes) return String is
   begin
      case Note is
         when C =>
            return "Do";
         when Csharp =>
            return "Do#";
         when D =>
            return "Re";
         when Dsharp =>
            return "Re#";
         when E =>
            return "Mi";
         when F =>
            return "Fa";
         when Fsharp =>
            return "Fa#";
         when G =>
            return "Sol";
         when Gsharp =>
            return "Sol#";
         when A =>
            return "La";
         when Asharp =>
            return "La#";
         when B =>
            return "Si";
         when Nothing =>
            return "not a note";
      end case;
   end NoteToString;

   function ByteToNote (Byte : NoteByte) return Notes is
      pragma Unreferenced (Byte);
   begin
      return A;
   end ByteToNote;

end Note;
