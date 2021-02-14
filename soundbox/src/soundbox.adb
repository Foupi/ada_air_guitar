with Ada.Text_IO;   use Ada.Text_IO;
with Ada.Streams;   use Ada.Streams;
with Ada.Real_Time; use Ada.Real_Time;

with Deserialization;  use Deserialization;
with Note;             use Note;
with Serial;           use Serial;
with rt_note_player_h; use rt_note_player_h;

procedure Soundbox is

   procedure Play_Note (N : Notes) is
   begin
      Put_Line("Sending " & Notes'Pos (N)'Image);

      set_note (Notes'Pos (N));
   end Play_Note;

   Current_Byte : Byte;
   Note         : Notes;

begin
   SerialSetup;
   audio_setup;

   loop
      Put_Line ("Waiting for byte reception!");

      Current_Byte := Serial_Receive_Byte;
      Put_Line ("Received byte: " & Current_Byte'Image);

      if Current_Byte = Reset_Byte then
         Put_Line ("Board was reset!");
      else
         Note := Byte_To_Note (Current_Byte);
         Put_Line ("Note: " & NoteToString (Note));
         Play_Note (Note);
      end if;
   end loop;

end Soundbox;
