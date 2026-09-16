switch (room)
{
    case rm_Dialogo01:
        if (global.conhecido) {
            room_goto(rm_TimeSkip02);
        } else {
            start_dialogue(Dialogo01, false);
        }
    break;

    case rm_Dialogo02:
        start_dialogue(Dialogo02, false);
    break;

    case rm_Dialogo03:
        start_dialogue(Dialogo03, false);
    break;

    case rm_TimeSkip01:
        start_dialogue(["...Em Casa..."], false);
    break;

    case rm_TimeSkip02:
        if (room == rm_TimeSkip02)
		{
		    timeskip02_iniciado = true;
		    start_dialogue(["..no pc.."], false);
		}
    break;

    case rm_Jogo:
        if (global.bloqueado) {
            start_dialogue(Version02_1_Bloqueado, true);
        }
        else if (!global.conhecido) {
            start_dialogue(Version01_Intro, true);
        }
        else {
            start_dialogue(Version02_2_Reencontro, true);
        }
		
		if (room == rm_Jogo)
		{
		    // Inicia a música em loop se ela ainda não estiver tocando
		    if (!audio_is_playing(musica_jogo))
		    {
		        musica_jogo = audio_play_sound(snd_MusicGame, 1, true, global.Music_volume);
		    }
		}
    break;

    case rm_Fim01:
        start_dialogue(_QI01.N[0], false);
    break;
}
