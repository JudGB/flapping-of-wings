if (variable_global_exists("stopspeak") && global.stopspeak) exit;

var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

if (state == DIALOGUE_STATE.EXITING)
{
    draw_clear(c_black);
    scribble($"[f_TelaInic][wave]{texto_encerrando}[/wave]")
        .align(fa_center, fa_middle)
        .blend(c_white, 1)
        .draw(_gui_w / 2, _gui_h / 2);
		
	if keyboard_check_pressed(vk_escape) {
		if window_get_fullscreen() = true{
			window_set_fullscreen(false)
		}else{
			window_set_fullscreen(true)
		}
	}
    exit;
}

if (room == rm_Jogo)
{
	if keyboard_check_pressed(vk_escape) {
		if window_get_fullscreen() = true{
			window_set_fullscreen(false)
		}else{
			window_set_fullscreen(true)
		}
	}
	
    var _pos_x = 50;
    var _pos_y_inicial = 100;
    var _largura_chat = _gui_w - 100;
    var _cor_blend = (variable_global_exists("cor_texto_chat")) ? global.cor_texto_chat : c_white;

    var _pos_y_atual = _pos_y_inicial;

    // DESENHO LEVE DO CHAT (sem recriar Scribble em loops duplos)
    for (var i = 0; i < array_length(chat_history); i++)
    {
        var _text = chat_history[i];
        var _element = scribble($"[f_TelaInic]{_text}").align(fa_left).wrap(_largura_chat).blend(_cor_blend, 1);
        
        if (i == array_length(chat_history) - 1 && state == DIALOGUE_STATE.SPEAKING) {
            _element.draw(_pos_x, _pos_y_atual, typist);
        } else {
            _element.draw(_pos_x, _pos_y_atual);
        }
        
        _pos_y_atual += _element.get_height() + 12;
    }
    
    // PERGUNTAS E OPÇÕES DE RESPOSTA
    if (state == DIALOGUE_STATE.CHOICE && current_choice != undefined)
    {
        var _choice_element = scribble($"[f_TelaInic]{current_choice.Q}").align(fa_left).wrap(_largura_chat).blend(_cor_blend, 1);
        _choice_element.draw(_pos_x, _pos_y_atual);
        
        _pos_y_atual += _choice_element.get_height() + 16;

        var _is_bugged = (variable_instance_exists(id, "_QSV04") && current_choice == _QSV04) || 
                         (variable_instance_exists(id, "_QSV02") && current_choice == _QSV02);

        if (_is_bugged) 
        {
            var _texto_sim1 = (selected_option == 0) ? "[c_yellow]> SIM <[/c]" : "  SIM  ";
            var _texto_sim2 = (selected_option == 1) ? "[c_yellow]> SIMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM <[/c]" : "  SIMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM  ";
            
            scribble($"[f_TelaInic]{_texto_sim1}").align(fa_left).blend(_cor_blend, 1).draw(_pos_x, _pos_y_atual);
            scribble($"[f_TelaInic]{_texto_sim2}").align(fa_left).blend(_cor_blend, 1).draw(_pos_x + 150, _pos_y_atual);
        } 
        else 
        {
            var _opt0 = (selected_option == 0) ? "[c_yellow]> NÃO <[/c]" : "  NÃO  ";
            var _opt1 = (selected_option == 1) ? "[c_yellow]> SIM <[/c]"  : "  SIM  ";
            
            scribble($"[f_TelaInic]{_opt0}").align(fa_left).blend(_cor_blend, 1).draw(_pos_x, _pos_y_atual);
            scribble($"[f_TelaInic]{_opt1}").align(fa_left).blend(_cor_blend, 1).draw(_pos_x + 150, _pos_y_atual);
        }
    }
}
else
{
    switch (state)
    {
        case DIALOGUE_STATE.SPEAKING:
            if (script_exists(asset_get_index("scr_DrawBoxText"))) scr_DrawBoxText(1, 100, 1, 1);
            if (script_exists(asset_get_index("scr_SpeakText"))) scr_SpeakText(current_dialogue, dialogue_index, fa_center, _gui_w / 2, 565, c_white, typist);
        break;

        case DIALOGUE_STATE.CHOICE:
            if (script_exists(asset_get_index("scr_DrawBoxText"))) scr_DrawBoxText(1, 100, 1, 1);
            if (current_choice != undefined)
            {
                scribble($"[f_TelaInic]{current_choice.Q}").align(fa_center).wrap(_gui_w - 200).draw(_gui_w / 2, 520);
                
                var _opt0 = (selected_option == 0) ? "[c_yellow]> NÃO <[/c]" : "  NÃO  ";
                var _opt1 = (selected_option == 1) ? "[c_yellow]> SIM <[/c]"  : "  SIM  ";
                
                scribble($"[f_TelaInic]{_opt0}").align(fa_center).draw(_gui_w / 2 - 100, 570);
                scribble($"[f_TelaInic]{_opt1}").align(fa_center).draw(_gui_w / 2 + 100, 570);
            }
        break;
    }
}