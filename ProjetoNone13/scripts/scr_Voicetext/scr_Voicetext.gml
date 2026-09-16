function dialog_voice_callback(_character)
{
    // Ignora espaços e quebras de linha
    if (_character == " " || _character == "\n")
        return;

    var voice = audio_play_sound(snd_DilogueBeep, 0, false);

    audio_sound_pitch(voice, random_range(0.95, 1.05));
}