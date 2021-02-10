with STM32.GPIO;
with STM32.Device;
with STM32.User_Button;
with STM32.Board;   use STM32.Board;
with Ada.Real_Time; use Ada.Real_Time;

with Dist;          use Dist;
with Note;          use Note;
with Screen;        use Screen;
with Sensor;        use Sensor;

procedure Main is
   Period          : constant Time_Span := Milliseconds (300);
   Next_Release    : Time               := Clock;
   Distance_Sensor : Sonar              :=
     (Pin_Trigger => STM32.Device.PE6, Pin_Echo => STM32.Device.PE4);
   Dist            : Distance;
   Current_Note    : Notes;
begin

   STM32.Board.Initialize_LEDs;
   STM32.User_Button.Initialize;
   All_LEDs_Off;

   ScreenSetup;

   STM32.GPIO.Configure_IO
     (Distance_Sensor.Pin_Trigger,
      (Mode  => STM32.GPIO.Mode_Out, Output_Type => STM32.GPIO.Push_Pull,
       Speed => STM32.GPIO.Speed_100MHz, Resistors => STM32.GPIO.Floating));
   --  OUTPUT TRIGGER

   STM32.GPIO.Configure_IO
     (Distance_Sensor.Pin_Echo,
      (Mode => STM32.GPIO.Mode_In, Resistors => STM32.GPIO.Floating));
   --  INPUT ECHO

   Distance_Sensor.Pin_Trigger.Clear;
   Distance_Sensor.Pin_Echo.Clear;

   loop
      while not STM32.User_Button.Has_Been_Pressed loop
         null;
         --  Busy waiting! I wish there was another way to do it...
      end loop;
      --  Why hide the interrupts?

      Dist         := GetDistance (Distance_Sensor);
      Current_Note := DistanceToNote (Dist);

      ScreenDisplay (Dist, Current_Note);

      Next_Release := Next_Release + Period;
      delay until Next_Release;
      --  Wait until next period.

   end loop;
end Main;
