with Dist; use Dist;
with Note; use Note;

package Screen is

   procedure ScreenSetup;
   --  Initializes the board's screen.

   procedure ScreenDisplay (Dist : Distance; Note : Notes);
   --  Displays the given distance (in cm) and the corresponding note on the
   --  board's screen.

   procedure ScreenDebug (Msg : String);
   --  Displays a debug message on the board's screen.
end Screen;
