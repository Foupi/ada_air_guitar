package body Uart is

   procedure UART_Setup is
   begin
      Enable_Clock (Sender);
      Enable_Clock (RX_Pin & TX_Pin);

      Configure_IO
        (RX_Pin & TX_Pin,
         (Mode           => Mode_AF,
          AF             => Sender_AF,
          Resistors      => Pull_Up,
          AF_Speed       => Speed_50MHz,
          AF_Output_Type => Push_Pull));
      --  Configure GPIO

      Disable (Sender);

      Set_Baud_Rate    (Sender, 115_200);
      Set_Mode         (Sender, Tx_Rx_Mode);
      Set_Stop_Bits    (Sender, Stopbits_1);
      Set_Word_Length  (Sender, Word_Length_8);
      Set_Parity       (Sender, No_Parity);
      Set_Flow_Control (Sender, No_Flow_Control);
      --  Set UART communication

      Enable (Sender);
   end UART_Setup;

   procedure UART_Send_Byte (To_Send : Byte) is
   begin
      loop
         exit when Tx_Ready (Sender);
      end loop;

      Transmit (Sender, UInt9 (To_Send));
   end UART_Send_Byte;

end Uart;
