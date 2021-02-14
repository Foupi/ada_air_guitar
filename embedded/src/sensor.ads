with HAL.GPIO;
with STM32.Device;
with STM32.GPIO;
with Ada.Real_Time; use Ada.Real_Time;

with Dist; use Dist;

package Sensor is

   type Sonar is tagged record
      Pin_Trigger : STM32.GPIO.GPIO_Point := STM32.Device.PE6;
      Pin_Echo    : STM32.GPIO.GPIO_Point := STM32.Device.PE4;
   end record;

   function GetDistance (Self : in out Sonar) return Distance;
   --  Returns the distance measured by the sensor

   procedure Initialize (Self : in out Sonar);
   --  Initialize the sonar GPIOs

   function Initialized (Self : Sonar) return Boolean;
   --  Returns wether the sensor is initialized or not

private

   Is_Initialized : Boolean := False;

   function PulseInHigh
     (Pin_Echo : STM32.GPIO.GPIO_Point; Timeout : Time_Span := Seconds (5))
      return Duration;
   --  Reads a pulse (either HIGH or LOW) on a pin. For example, if value is
   --  HIGH, pulseIn() waits for the pin to go from LOW to HIGH, starts timing,
   --  then waits for the pin to go LOW and stops timing. Returns the length of
   --  the pulse in microseconds or gives up and returns 0 if no complete pulse
   --  was received within the timeout.

end Sensor;
