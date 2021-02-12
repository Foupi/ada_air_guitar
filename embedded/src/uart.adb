with HAL.UART; use HAL.UART;

package body Uart is

   procedure UARTSetup is
   begin
      Enable_Clock (TX_Pin);
      Enable_Clock (Sender);

      Configure_IO (TX_Pin, (
                    Mode           => Mode_AF,
                    AF             => GPIO_AF_USART1_7,
                    Resistors      => Pull_Up,
                    AF_Output_Type => Push_Pull,
                    AF_Speed       => Speed_50MHz
                   ));
      --  Configure TX

      Disable (Sender);

      Set_Baud_Rate    (Sender, 115_200);
      Set_Mode         (Sender, Tx_Rx_Mode);
      Set_Stop_Bits    (Sender, Stopbits_1);
      Set_Word_Length  (Sender, Word_Length_8);
      Set_Parity       (Sender, No_Parity);
      Set_Flow_Control (Sender, No_Flow_Control);
      --  Set UART communication

      Enable (Sender);
   end UARTSetup;

   function UART_Send_Byte (Byte : UInt8) return Boolean is
      Data   : UART_Data_8b (1 .. 1);
      Status : UART_Status;
   begin
      Data (1) := Byte;

      Sender.Transmit (Data, Status);
      return Status = Ok;
   end UART_Send_Byte;

end Uart;
