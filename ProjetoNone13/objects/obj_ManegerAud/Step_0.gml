switch (room)
{
    case rm_TimeSkip01:
    case rm_TimeSkip02:
        // Stop Music menu
        VinylFadeOut(Music_menu, 0.5);
        
        // Se a música do jogo ainda estiver tocando, para ela
        if (audio_is_playing(musica_jogo)) {
            audio_stop_sound(musica_jogo);
        }
        
        // Efeitos Sonoros de clique
        if (mouse_check_button_pressed(mb_left)) {
            audio_play_sound(snd_EffConfirm, 5, false, global.volume + 2);   
        }
    break;
}