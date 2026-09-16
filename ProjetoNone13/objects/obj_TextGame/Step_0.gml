show_debug_message(index)
if keyboard_check_pressed(vk_space){
	if(index == 1)
	{

		// 2. Agenda o fechamento do jogo para daqui a 5 segundos
		call_later(0.5, time_source_units_seconds, function() {
		    
			room_goto(rm_TimeSkip01);
			
		});
	}
	if(index == 2)
	{
		room_goto(rm_Config)	
		//audio_play_sound(snd_EffConfirm, 0, false, global.volume, 0)
	}
	if(index == 3)
	{
		room_goto(rm_creditos)
		//audio_play_sound(snd_EffConfirm, 0, false, global.volume, 0)
	}
	if(index == 4)
	{
		// 1. Toca o som
		//audio_play_sound(snd_EffConfirm, 0, false, global.volume, 0)

		// 2. Agenda o fechamento do jogo para daqui a 5 segundos
		call_later(0.5, time_source_units_seconds, function() {
		    game_end();
		});
	
	}
}

