package body Serial is

   procedure SerialSetup is
      Receiver_Name : constant Port_Name := "/dev/ttyUSB0";
      --  System name of the device connected to the board's UART.
      
      Time_Out      : constant Duration := 15.0;
   begin
      Receiver.Open (Receiver_Name);
      
      Receiver.Set (Rate      => B115200,
                    Bits      => CS8,
                    Stop_Bits => One,
                    Parity    => None,
                    Block     => True,
                    Local     => True,
                    Flow      => None,
                    Timeout   => Time_Out);
   end SerialSetup;
   
   function Serial_Receive_Byte return Byte is
      Offset : Stream_Element_Offset;
      Buffer : Stream_Element_Array (1 .. 1);
   begin
      Receiver.Read (Buffer, Offset);
      
      return Byte (Buffer (1));
   end Serial_Receive_Byte;
   
end Serial;
