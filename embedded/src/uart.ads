with HAL;          use HAL;
with STM32.Device; use STM32.Device;
with STM32.GPIO;   use STM32.GPIO;
with STM32.USARTs; use STM32.USARTs;

package Uart is

   procedure UARTSetup;
   --  Sets up the UART for sending.

   function UART_Send_Byte (Byte : UInt8) return Boolean;
   --  Sends the given byte on the UART channel. Returns true if everything
   --  went correctly, false otherwise.

private

   TX_Pin : constant GPIO_Point := PB7;
   --  The UART TX GPIO pin

   Sender : USART renames USART_1;
   --  USART instead of UART? Yes. There is no tutorial anywhere so I ripped
   --  off an ADL example.

end Uart;
