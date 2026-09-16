if room == rm_Config 
{
	show_debug_message("oi")
	if keyboard_check_pressed(vk_escape)
	{
		room_goto(rm_TelaInicial)
		//audio_play_sound(snd_EffConfirm, 0, false, global.volume, 0)
	}
}

if room == rm_creditos
{
	show_debug_message("oi")
	if keyboard_check_pressed(vk_escape)
	{
		room_goto(rm_TelaInicial)
		//audio_play_sound(snd_EffConfirm, 0, false, global.volume, 0)
	}
}


