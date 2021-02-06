package body Note is

   function IntegerToNote (Int : Integer) return Notes is
      Interval : constant Integer := 5;
   begin
      if Int <= Interval * (Notes'Pos (C) + 1) then
         return C;         --  Do
      elsif Int <= Interval * (Notes'Pos (Csharp) + 1) then
         return Csharp;    --  Do#
      elsif Int <= Interval * (Notes'Pos (D) + 1) then
         return D;         --  Re
      elsif Int <= Interval * (Notes'Pos (Dsharp) + 1) then
         return Dsharp;    --  Re#
      elsif Int <= Interval * (Notes'Pos (E) + 1) then
         return E;         --  Mi
      elsif Int <= Interval * (Notes'Pos (F) + 1) then
         return F;         --  Fa
      elsif Int <= Interval * (Notes'Pos (Fsharp) + 1) then
         return Fsharp;    --  Fa#
      elsif Int <= Interval * (Notes'Pos (G) + 1) then
         return G;         --  Sol
      elsif Int <= Interval * (Notes'Pos (Gsharp) + 1) then
         return Gsharp;    --  Sol#
      elsif Int <= Interval * (Notes'Pos (A) + 1) then
         return A;         --  La
      elsif Int <= Interval * (Notes'Pos (Asharp) + 1) then
         return Asharp;    --  La#
      elsif Int <= Interval * (Notes'Pos (B) + 1) then
         return B;         --  Si
      else
         return Nothing;   -- Default note
      end if;
   end IntegerToNote;

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

   function NoteToByte (Note : Notes) return NoteByte is
      pragma Unreferenced (Note);
   begin
      return 0;
   end NoteToByte;

   function ByteToNote (Byte : NoteByte) return Notes is
      pragma Unreferenced (Byte);
   begin
      return A;
   end ByteToNote;

end Note;
