
package body Uart is

   procedure UARTSetup is
   begin
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
      Set_Mode         (Sender, Tx_Mode);
      Set_Stop_Bits    (Sender, Stopbits_1);
      Set_Word_Length  (Sender, Word_Length_8);
      Set_Parity       (Sender, No_Parity);
      Set_Flow_Control (Sender, No_Flow_Control);

      Enable (Sender);
   end UARTSetup;

   procedure UARTSendNote (Note : Notes) is
   begin
      null;
   end UARTSendNote;

end Uart;
