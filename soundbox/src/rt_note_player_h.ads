with Interfaces.C; use Interfaces.C;

package rt_note_player_h is

   -- Sets the static note (see source file) to the given value.
   procedure set_note (note_idx : int) with
      Import        => True,
      Convention    => C,
      External_Name => "set_note";

   -- Sets up the audio stream with predefined parameters (see source file).
   procedure audio_setup with
      Import        => True,
      Convention    => C,
      External_Name => "audio_setup";

end rt_note_player_h;
