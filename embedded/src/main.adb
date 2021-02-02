with STM32.Board;   use STM32.Board;
with STM32.GPIO;    use STM32.GPIO;
with Ada.Real_Time; use Ada.Real_Time;

procedure Main is
   procedure Blinky is

      Period : constant Time_Span := Milliseconds (1000);  -- arbitrary

      Next_Release : Time := Clock;

   begin
      STM32.Board.Initialize_LEDs;

      loop
         STM32.Board.Toggle (Green_LED);

         Next_Release := Next_Release + Period;
         delay until Next_Release;
      end loop;
   end Blinky;
begin
   Blinky;
end Main;
