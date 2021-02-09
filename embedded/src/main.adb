with STM32.GPIO;
with STM32.Device;
with STM32.User_Button;
with Sensor;        use Sensor;
with STM32.Board;   use STM32.Board;
with Ada.Real_Time; use Ada.Real_Time;
with HAL.Bitmap;
with Screen;        use Screen;

procedure Main is
   Period          : constant Time_Span := Milliseconds (300);
   Next_Release    : Time               := Clock;
   Distance_Sensor : Sonar              :=
     (Pin_Trigger => STM32.Device.PE6, Pin_Echo => STM32.Device.PE4);
   Distance     : Float;
   Distance_Int : Integer;
begin

   STM32.Board.Initialize_LEDs;
   STM32.User_Button.Initialize;
   All_LEDs_Off;

   ScreenSetup;

   --  OUTPUT TRIGGER
   STM32.GPIO.Configure_IO
     (Distance_Sensor.Pin_Trigger,
      (Mode  => STM32.GPIO.Mode_Out, Output_Type => STM32.GPIO.Push_Pull,
       Speed => STM32.GPIO.Speed_100MHz, Resistors => STM32.GPIO.Floating));

   --  INPUT ECHO
   STM32.GPIO.Configure_IO
     (Distance_Sensor.Pin_Echo,
      (Mode => STM32.GPIO.Mode_In, Resistors => STM32.GPIO.Floating));

   Distance_Sensor.Pin_Trigger.Clear;
   Distance_Sensor.Pin_Echo.Clear;

   loop
      Distance     := GetDistance (Distance_Sensor);
      Distance_Int := Integer (Distance);
      ScreenDisplay (Distance_Int);

      Next_Release := Next_Release + Period;
      delay until Next_Release;
   end loop;
end Main;
