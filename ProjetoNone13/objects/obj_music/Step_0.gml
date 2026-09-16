// Raio/Tamanho do botão desenhado
var button_x = bar_x + (Music_volume  * bar_width);

// Checa se clicou perto do botão ou na barra
if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(mouse_x, mouse_y, bar_x, bar_y - 10, bar_x + bar_width, bar_y + bar_height + 10)) {
        arrastando = true;
    }
}

// Soltou o clique? Para de arrastar
if (mouse_check_button_released(mb_left)) {
    arrastando = false;
}

// Se estiver arrastando, recalcula o volume
if (arrastando) {
    var mouse_pos = clamp(mouse_x, bar_x, bar_x + bar_width);
    Music_volume  = (mouse_pos - bar_x) / bar_width;
    
    // Aplica o volume no som global (usando a curva de áudio)
	
    //audio_group_set_gain(audiogroup_musica, Music_volume  * Music_volume);
}


