/// @function scr_SpeakText(TextArray, index, align, PosX, PosY, Color, typist)
function scr_SpeakText(_text_array, _index, _align, _pos_x, _pos_y, _color, _typist)
{
    if (!is_array(_text_array) || array_length(_text_array) == 0) return true;
    
    // Garante que o índice não saia dos limites
    _index = clamp(_index, 0, array_length(_text_array) - 1);
    
    // 1. FORÇA A COR BRANCA E OPACIDADE TOTAL NO GAMEMAKER
    draw_set_colour(c_white);
    draw_set_alpha(1.0);
    
    // 2. DESENHA O TEXTO ADICIONANDO O TAG DE COR BRANCA [c_white]
    var _texto_atual = _text_array[_index];
    scribble($"[f_TelaInic][c_white]{_texto_atual}").align(_align).draw(_pos_x, _pos_y, _typist);
    
    // Controle de áudio por frame de digitação
    var _esta_digitando = (_typist.get_state() < 1.0);
    if (_esta_digitando) 
    {
        if (!audio_is_playing(snd_DilogueBeep)) 
            audio_play_sound(snd_DilogueBeep, 10, true);
    } 
    else 
    {
        if (audio_is_playing(snd_DilogueBeep)) 
            audio_stop_sound(snd_DilogueBeep);
    }
    
    return _esta_digitando;
}

/// @function scr_DrawBoxText(L1, L2, L3, L4)
function scr_DrawBoxText(_l1, _l2, _l3, _l4)
{
    draw_set_colour(c_gray);
    draw_rectangle(_l1, room_height/2 + _l2, room_width + _l3, room_height + _l4, false);
    draw_set_colour(c_dkgray);
    draw_rectangle(_l1 * 10, room_height/2 + (_l2 + 10), room_width - (10 * _l3), room_height - (10 * _l4), false);
    draw_set_colour(c_white);
}