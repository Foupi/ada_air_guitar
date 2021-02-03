with HAL.GPIO;
with STM32.Device;
with STM32.GPIO;    use STM32.GPIO;
with Ada.Real_Time; use Ada.Real_Time;

--  double == Long_Double change float to that
package Sensor is

   type Sonar is record
      Pin_Trigger : GPIO_Point := STM32.Device.PA13;
      Pin_Echo    : GPIO_Point := STM32.Device.PC2;
   end record;

   procedure Dump (Self : in out Sonar);

   function GetDistance (Self : in out Sonar) return Float;

private

   type Pin_Value is (Low, High);

   for Pin_Value use (Low => 0, High => 1);

   function PulseIn
     (Pin_Echo : GPIO_Point; Value : Pin_Value := High;
      Timeout  : Time_Span := Seconds (5)) return Duration;

end Sensor;
