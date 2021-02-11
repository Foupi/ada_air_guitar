package body Sensor is

   function GetDistance (Self : in out Sonar) return Distance is
      Period_2_Microseconds  : constant Time_Span := Microseconds (2);
      Period_10_Microseconds : constant Time_Span := Microseconds (10);
      SpeedOfSonudInCmPerMs  : constant Float := 0.033_13 + 0.000_060_6
        * 19.307;
      DurationMicroseconds   : Float;
      DistanceCm             : Float;
   begin
      --  Make sure that trigger pin is LOW.
      Self.Pin_Trigger.Set_Mode (HAL.GPIO.Output);
      Self.Pin_Trigger.Clear; --  set to low

      --  wait 2 micro sec for state to register
      delay until Clock + Period_2_Microseconds;

      --  Self.Pin_Trigger.Set;
      STM32.GPIO.Set (Self.Pin_Trigger);

      delay until Clock + Period_10_Microseconds;
      --  Hold trigger for 10 microseconds, which is signal for sensor to
      --  measure distance
      Self.Pin_Trigger.Clear;

      DurationMicroseconds :=
        Float (PulseInHigh (Self.Pin_Echo)) * 1_000_000.0;
      --  multiply by 1_000_000 to have the correct unit

      DistanceCm := DurationMicroseconds / 2.0 * SpeedOfSonudInCmPerMs;
      --  Divide duration by 2 as it sound goes away from and then back to the
      --  sonar.

      return Distance (DistanceCm);
      --  return 30.0;
   end GetDistance;

   function PulseInHigh
     (Pin_Echo : STM32.GPIO.GPIO_Point; Timeout : Time_Span := Seconds (5))
      return Duration
   is
      Timeout_Time          : constant Time := Clock + Timeout;
      Time_Start, Time_Stop : Time;
   begin

      --  wait to the pin to go high
      while STM32.GPIO.Set (Pin_Echo) /= True loop
         --  if timeout limit is met, return a 0 duration
         if Clock >= Timeout_Time then
            return To_Duration (Nanoseconds (0));
         end if;
      end loop;

      Time_Start := Clock; -- get current time

      --  wait for pin to go low
      while STM32.GPIO.Set (Pin_Echo) = True loop
         --  if timeout limit is met, return a 0 duration
         if Clock >= Timeout_Time then
            return To_Duration (Nanoseconds (0));
         end if;
      end loop;

      Time_Stop := Clock;

      return To_Duration (Time_Stop - Time_Start);
   end PulseInHigh;

end Sensor;
