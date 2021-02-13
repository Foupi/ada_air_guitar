with HAL;           use HAL;
with STM32;         use STM32;
with STM32.Device;  use STM32.Device;
with STM32.GPIO;    use STM32.GPIO;
with STM32.USARTs;  use STM32.USARTs;

with Serialization; use Serialization;

package Uart is

   procedure UART_Setup;
   --  Sets up the UART for sending.

   procedure UART_Send_Byte (To_Send : Byte);
   --  Sends the given byte on the UART channel. Returns true if everything
   --  went correctly, false otherwise.

private

   TX_Pin : constant GPIO_Point := PD6;
   RX_Pin : constant GPIO_Point := PD5;
   --  The UART GPIO pins.

   Sender : USART renames USART_2;
   --  USART instead of UART? Yes. There is no tutorial anywhere so I ripped
   --  off an ADL example.

   Sender_AF : GPIO_Alternate_Function := GPIO_AF_USART2_7;
   --  USART alternate function.

end Uart;
