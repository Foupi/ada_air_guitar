package body Deserialization is

   function Byte_To_Note (Byte : Note_Byte) return Notes is
   begin
      return Notes'Val (Byte);
   end Byte_To_Note;

end Deserialization;
