with Ada.Text_IO; use Ada.Text_IO;

package body Sensor is

   procedure Dump (Self : in out Sonar) is
   begin
      Put_Line ("Dump Sonar");
      Put_Line ("Sonar.Pin_Trigger ->" & Self.Pin_Trigger.Pin'Image);
      Put_Line ("Sonar.Pin_Echo    ->" & Self.Pin_Echo.Pin'Image);
      Put_Line ("");
   end Dump;

   function GetDistance (Self : in out Sonar) return Float is
      Period_2_Microseconds  : constant Time_Span := Microseconds (2);
      Period_10_Microseconds : constant Time_Span := Microseconds (10);
      DurationMicroseconds   : Float;
      SpeedOfSonudInCmPerMs  : Float;
      DistanceCm             : Float;
   begin
      --  Make sure that trigger pin is LOW.
      Self.Pin_Trigger.Set_Mode (HAL.GPIO.Output);
      Self.Pin_Trigger.Clear; --  set to low

      --  wait 2 micro sec for state to register
      delay until Clock + Period_2_Microseconds;

      --  Hold trigger for 10 microseconds, which is signal for sensor to
      --  measure distance

      --  Self.Pin_Trigger.Set;
      STM32.GPIO.Set (Self.Pin_Trigger);

      delay until Clock + Period_10_Microseconds;
      Self.Pin_Trigger.Clear;

      DurationMicroseconds := Float (PulseIn (Self.Pin_Echo, High));

      SpeedOfSonudInCmPerMs := 0.033_13 + 0.000_060_6 * 19.307;

      DistanceCm := DurationMicroseconds / 2.0 * SpeedOfSonudInCmPerMs;

      if DistanceCm <= 0.3 or DistanceCm >= 400.0 then
         return -1.0;
      else
         return DistanceCm;
      end if;

   end GetDistance;

   function PulseIn
     (Pin_Echo : GPIO_Point; Value : Pin_Value := High;
      Timeout  : Time_Span := Seconds (5)) return Duration
   is
   begin
      --  Reads a pulse (either HIGH or LOW) on a pin. For example, if value
      --  is HIGH, pulseIn() waits for the pin to go from LOW to HIGH, starts
      --  timing, then waits for the pin to go LOW and stops timing. Returns
      --  the length of the pulse in microseconds or gives up and returns 0
      --  if no complete pulse was received within the timeout.

      --        while ((*portInputRegister(port) & bit) == stateMask)
      --  if (numloops++ == maxloops)
      --      return 0;

      --        // wait for the pulse to start
      --        while ((*portInputRegister(port) & bit) != stateMask)
      --                if (numloops++ == maxloops)
      --                        return 0;

      --        // wait for the pulse to stop
      --        while ((*portInputRegister(port) & bit) == stateMask) {
      --                if (numloops++ == maxloops)
      --                        return 0;
      --                width++;
      --        }
      return To_Duration (Microseconds (20));
   end PulseIn;

end Sensor;
