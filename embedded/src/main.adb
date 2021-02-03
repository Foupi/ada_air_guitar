with STM32.GPIO;
with STM32.Device;
with STM32.User_Button;
with Sensor;        use Sensor;
with STM32.Board;   use STM32.Board;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO;   use Ada.Text_IO;

procedure Main is
   Period          : constant Time_Span := Milliseconds (100);
   Next_Release    : Time               := Clock;
   Choice          : Boolean            := True;
   Distance_Sensor : Sonar              :=
     (Pin_Trigger => STM32.Device.PA4, Pin_Echo => STM32.Device.PA6);
   Distance : Float;
begin

   STM32.Board.Initialize_LEDs;
   STM32.User_Button.Initialize;
   All_LEDs_Off;

   --  OUTPUT TRIGGER
   STM32.GPIO.Configure_IO
     (Distance_Sensor.Pin_Trigger,
      (Mode  => STM32.GPIO.Mode_Out, Output_Type => STM32.GPIO.Push_Pull,
       Speed => STM32.GPIO.Speed_100MHz, Resistors => STM32.GPIO.Floating));

   --  INPUT ECHO
   STM32.GPIO.Configure_IO
     (Distance_Sensor.Pin_Echo,
      (Mode => STM32.GPIO.Mode_In, Resistors => STM32.GPIO.Floating));

   loop

      if STM32.User_Button.Has_Been_Pressed then
         Choice := not Choice;
         STM32.Board.All_LEDs_Off;
      end if;

      if Choice then
         STM32.Board.Toggle (Green_LED);
      else
         STM32.Board.Toggle (Red_LED);
      end if;

      Distance := GetDistance (Self => Distance_Sensor);

      Put_Line ("Distance:" & Distance'Image);

      Next_Release := Next_Release + Period;
      delay until Next_Release;
   end loop;
end Main;
