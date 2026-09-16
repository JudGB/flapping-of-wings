switch(keyboard_key)
{
	case vk_up:
	case vk_down:
	if room = rm_TelaInicial
	{
		//Efeito sonoro de navegação por up e down
		audio_play_sound(snd_EffNavegation, 5, false, global.volume + 2, 0, 1.2)	
	}
	break;
	
	case vk_escape:
	if room != rm_TelaInicial
	{
		//Efeito sonoro de confirmação, usado para quando clicar esc
		audio_play_sound(snd_EffConfirm, 5, false, global.volume + 2)		
	}
	break;
	
	case vk_enter:
	if room = rm_TelaInicial
	{
		//Efeito sonoro de confirmação por enter
		audio_play_sound(snd_EffConfirm, 5, false, global.volume + 2)	
	}
	break;
	
	
}