with HAL;          use HAL;
with STM32.Device; use STM32.Device;
with STM32.GPIO;   use STM32.GPIO;
with STM32.USARTs; use STM32.USARTs;

with Note; use Note;

package Uart is

   procedure UARTSetup;
   --  Sets up the UART for sending.

   function UARTSendNote (Note : Notes) return Boolean;
   --  Sends the given note on the UART channel. Returns true if everything
   --  went correctly, false otherwise.

private

   TX_Pin : constant GPIO_Point := PB7;
   --  The UART TX GPIO pin

   Sender : USART renames USART_1;
   --  USART instead of UART? Yes. There is no tutorial anywhere so I ripped
   --  off an ADL example.

   function NoteToByte (Note : Notes) return UInt8;

end Uart;
