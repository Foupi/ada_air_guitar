with HAL.Framebuffer;
with STM32.GPIO;
with STM32.Device;
with STM32.User_Button;
with LCD_Std_Out;
with BMP_Fonts;
with Sensor;        use Sensor;
with STM32.Board;   use STM32.Board;
with Ada.Real_Time; use Ada.Real_Time;
with HAL.Bitmap;
with Note;          use Note;

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

   Display.Initialize;
   Display.Initialize_Layer (1, HAL.Bitmap.ARGB_8888);
   LCD_Std_Out.Set_Orientation (HAL.Framebuffer.Landscape);
   LCD_Std_Out.Set_Font (BMP_Fonts.Font16x24);
   LCD_Std_Out.Current_Background_Color := LCD_Std_Out.Black;
   LCD_Std_Out.Current_Text_Color       := LCD_Std_Out.White;
   Display.Hidden_Buffer (1).Set_Source (LCD_Std_Out.Black);
   Display.Hidden_Buffer (1).Fill;
   LCD_Std_Out.Clear_Screen;
   Display.Update_Layer (1, Copy_Back => True);

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
      LCD_Std_Out.Clear_Screen;
      Distance     := GetDistance (Distance_Sensor);
      Distance_Int := Integer (Distance);
      LCD_Std_Out.Put (0, 0, "Dist:" & Distance_Int'Image & "cm");
      LCD_Std_Out.Put
        (0, 50, "Note: " & NoteToString (IntegerToNote (Distance_Int)));

      Next_Release := Next_Release + Period;
      delay until Next_Release;
   end loop;
end Main;
