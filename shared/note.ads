package Note is

   type Notes is
     (C, Csharp, D, Dsharp, E, F, Fsharp, G, Gsharp, A, Asharp, B, Nothing);
   --  A music note

   function NoteToString (Note : Notes) return String;
   --  Translates the given note to a string.

end Note;
