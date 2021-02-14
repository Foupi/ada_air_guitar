package Screen is

   procedure ScreenSetup;
   --  Initializes the board's screen.

   type Screen_Position is (Top, Mid_Top, Mid_Bottom, Bottom);
   --  Describes a vertical position on the screen.

   procedure Screen_Clear;
   --  Clears the board's screen.

   procedure Screen_Display (Position : Screen_Position; Msg : String);
   --  Displays the given message at the given position on the board's screen.

private

   X_Index : constant Integer := 0;
   --  X position of each printed message.

   type Screen_Index is range 0 .. 200;
   --  Possible indexes on the Y axis of the board's LCD screen.

   type Position_Indexes is array (Screen_Position range <>) of Screen_Index;

   Indexes : constant Position_Indexes :=
     (Top        => Screen_Index'First,
      Mid_Top    => (Screen_Index'Last - Screen_Index'First) / 3,
      Mid_Bottom => ((Screen_Index'Last - Screen_Index'First) / 3) * 2,
      Bottom     => Screen_Index'Last);
   --  The indexes related to each position of the enumerated type.

end Screen;
