with STM32.GPIO;
with STM32.User_Button;
with STM32.Board;   use STM32.Board;
with Ada.Real_Time; use Ada.Real_Time;

with Dist;          use Dist;
with Note;          use Note;
with Sensor;        use Sensor;
with Serialization; use Serialization;
with Uart;          use Uart;
with Screen;        use Screen;

procedure Main is
   Period          : constant Time_Span := Milliseconds (300);
   Next_Release    : Time               := Clock;
   Distance_Sensor : Sonar;
   Dist            : Distance;
   Current_Note    : Notes;
   Byte            : Note_Byte;
begin

   STM32.Board.Initialize_LEDs;
   STM32.User_Button.Initialize;
   All_LEDs_Off;

   Distance_Sensor.Initialize;
   ScreenSetup;
   UART_Setup;

   Screen_Display (Mid_Top, "Setup complete!");

   loop

      Screen_Display (Bottom, "Press the button!");
      loop
         exit when STM32.User_Button.Has_Been_Pressed;
         --  Busy waiting! I wish there was another way to do it...
      end loop;
      --  Why hide the interrupts?

      Screen_Clear;

      Dist := Distance_Sensor.GetDistance;
      Screen_Display (Top, "Distance: " & Dist'Image);

      Current_Note := DistanceToNote (Dist);
      Screen_Display (Mid_Top, "Note: " & NoteToString (Current_Note));

      Byte := Note_To_Byte (Current_Note);
      Screen_Display (Mid_Bottom, "Byte: " & Byte'Image);

      UART_Send_Byte (Byte);

      Next_Release := Next_Release + Period;
      delay until Next_Release;
      --  Wait until next period.
   end loop;

end Main;
