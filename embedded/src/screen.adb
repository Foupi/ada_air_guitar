with HAL.Bitmap;
with HAL.Framebuffer;
with STM32.Board; use STM32.Board;
with LCD_Std_Out; use LCD_Std_Out;
with BMP_Fonts;   use BMP_Fonts;

package body Screen is

   procedure ScreenSetup is
   begin
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
   end ScreenSetup;

   procedure Screen_Clear is
   begin
      LCD_Std_Out.Clear_Screen;
   end Screen_Clear;

   procedure Screen_Display (Position : Screen_Position; Msg : String) is
      Y_Index : Screen_Index;
   begin
      Y_Index := Indexes (Position);

      LCD_Std_Out.Put (X_Index, Integer (Y_Index), Msg);
   end Screen_Display;

end Screen;
