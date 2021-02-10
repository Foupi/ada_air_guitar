with Note; use Note;

package Screen is

   procedure ScreenSetup;
   --  Initializes the board's screen.

   procedure ScreenDisplay (Distance : Integer; Note : Notes);
   --  Displays the given distance (in cm) and the corresponding note on the
   --  board's screen.

end Screen;
