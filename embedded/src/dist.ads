with Note; use Note;

package Dist is

   type Distance is digits 1 range 2.0 .. 400.0;
   --  Set of distances that can be measured by the sensor.

   function DistanceToNote (Dist : Distance) return Notes;
   --  Translates the given distance into a note.

end Dist;
