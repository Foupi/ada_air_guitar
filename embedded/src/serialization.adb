package body Serialization is

   function Note_To_Byte (Note : Notes) return Note_Byte is
   begin
      return Notes'Pos (Note);
   end Note_To_Byte;

end Serialization;
