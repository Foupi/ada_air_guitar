with Ada.Text_IO;   use Ada.Text_IO;
with Ada.Streams;   use Ada.Streams;
with Ada.Real_Time; use Ada.Real_Time;

with rt_note_player_h;
with Deserialization; use Deserialization;
with Note;            use Note;
with Serial;          use Serial;

procedure Soundbox is

   procedure Play_Note (N : Notes) is
   begin
      Put_Line ("Sending " & Notes'Pos (N)'Image);

      rt_note_player_h.set_note (Notes'Pos (N));
      delay 1.0; --  play for 1 second
      rt_note_player_h.set_note (Notes'Pos (Nothing)); -- reset note
   end Play_Note;

   procedure Audio_Initialization is
   begin
      Put_Line ("Setting up audio");
      rt_note_player_h.audio_setup;
   end Audio_Initialization;

   Current_Byte : Byte;
   Note         : Notes;
begin
   SerialSetup;
   Audio_Initialization;

   loop
      Put_Line ("");
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
