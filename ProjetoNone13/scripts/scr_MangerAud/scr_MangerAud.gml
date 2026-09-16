/*

PosX   = bar_x
PosY   = bar_y
BarW   = bar_width
BarH   = bar_height
Vol    = Volume
Arst   = Arrastando
Group  = audiogroup do audio

*/

function scr_MangerAud(PosX, PosY, BarW, BarH, Vol, Arst,Master = false, Group = undefined)
{

	// Raio/Tamanho do botão desenhado
	var button_x = PosX + (Vol * BarW);

	// Checa se clicou perto do botão ou na barra
	if (mouse_check_button_pressed(mb_left)) {
	    if (point_in_rectangle(mouse_x, mouse_y, PosX, PosY - 10, PosX + BarW, PosY + BarH + 10)) {
	        Arst = true;
	    }
	}

	// Soltou o clique? Para de arrastar
	if (mouse_check_button_released(mb_left)) {
	    Arst = false;
	}

	// Se estiver arrastando, recalcula o volume
	if (Arst) {
	    var mouse_pos = clamp(mouse_x, PosX, PosX + BarW);
	    Vol = (mouse_pos - PosX) / BarW;
    
	    // Aplica o volume no som global (usando a curva de áudio)
		volume_curva = Vol * Vol
		if Master == true and Group == undefined{
			audio_master_gain(volume_curva)	
		}else{
			audio_group_set_gain(Group, volume_curva, 0);
		}
	}
	
	// RETORNA OS DOIS VALORES ATUALIZADOS EM UM ARRAY [Arst, Vol]
	return [Arst, Vol];

}