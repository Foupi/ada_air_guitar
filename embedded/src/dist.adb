package body Dist is

   function DistanceToNote (Dist : Distance) return Notes is
      Interval : constant Float := 5.0;
      --  Interval in centimeters between two notes
      Note_Threshold : Distance;
      --  Maximum distance for a note
   begin
      for Curr_Note in Notes loop
         if Curr_Note = Nothing then
            return Nothing;
         end if;

         Note_Threshold :=
           Distance (2.0 + Interval * Float (Notes'Pos (Curr_Note) + 1));
         if Dist <= Note_Threshold then
            return Curr_Note;
         end if;

      end loop;
      return Nothing;
   end DistanceToNote;

end Dist;
