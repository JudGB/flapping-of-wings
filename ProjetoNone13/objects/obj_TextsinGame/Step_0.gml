if (variable_global_exists("stopspeak") && global.stopspeak) exit;
if (travar_no_final) exit;

var _key_advance = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
var _key_left    = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
var _key_right   = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));

switch (state) {
    case DIALOGUE_STATE.SPEAKING:
        if (typist.get_state() < 1.0) {
            if (_key_advance) typist.skip();
        } else {
            if (_key_advance) {
                dialogue_index++;
                
                if (dialogue_index < array_length(current_dialogue)) {
                    var _texto_atual = current_dialogue[dialogue_index];
                    
                    checar_sons_dialogo(_texto_atual);

                    if (is_chat_mode) {
                        array_push(chat_history, _texto_atual);
                        
                        // OTIMIZAÇÃO: Limita mensagens antigas para não sobrecarregar
                        if (array_length(chat_history) > 10) {
                            array_delete(chat_history, 0, 1);
                        }
                    }
                    typist.reset();
                    typist.in(0.2, 0);
                } else {
                    state = DIALOGUE_STATE.ENDED;
                }
            }
        }
        break;

    case DIALOGUE_STATE.CHOICE:
        if (_key_left)  selected_option = 0;
        if (_key_right) selected_option = 1;
        
        if (_key_advance) {
            var _resposta = (selected_option == 1) ? current_choice.S : current_choice.N;
            
            if (current_choice == _QSF02) global.pontos += (selected_option == 1) ? 1 : -1;
            if (current_choice == _QSF03) global.pontos += (selected_option == 1) ? -1 : 1;
            if (current_choice == _QSF04) global.pontos += (selected_option == 1) ? 1 : -1;
            if (current_choice == _QSF05) global.pontos += (selected_option == 1) ? -9999 : 2;

            start_dialogue(_resposta, is_chat_mode);
        }
        break;

    case DIALOGUE_STATE.ENDED:
        if (current_dialogue == Dialogo01) {
            scr_transition_room(rm_TimeSkip01, 0.2);
        }
        else if (room == rm_TimeSkip01) {
            scr_transition_room(rm_Dialogo02, 0.2);
        }
        else if (current_dialogue == Dialogo02) {
            start_choice(_QI01);
        }
        else if (current_dialogue == _QI01.N) {
            game_end();
        }
        else if (current_dialogue == _QI01.S) {
            start_dialogue(Dialogo03, false);
        }
        else if (current_dialogue == Dialogo03) {
            start_dialogue(Dialogo04, false);
        }
        else if (current_dialogue == Dialogo04) {
            scr_transition_room(rm_TimeSkip02, 0.2);        
        }
        else if (room == rm_TimeSkip02) {
            scr_transition_room(rm_Jogo, 0.2);
        }
        else if (current_dialogue == Version01_Intro) {
            start_choice(_QP_V1_01);
        }
        else if (current_dialogue == _QP_V1_01.S) {
            bloquear_jogador();
        }
        else if (current_dialogue == _QP_V1_01.N) {
            start_choice(_QSF02);
        }
        else if (current_dialogue == _QSF02.S || current_dialogue == _QSF02.N) {
            start_choice(_QSF03);
        }
        else if (current_dialogue == _QSF03.S || current_dialogue == _QSF03.N) {
            start_choice(_QSF04);
        }
        else if (current_dialogue == _QSF04.S || current_dialogue == _QSF04.N) {
            start_dialogue(Dialogo05, true);
        }
        else if (current_dialogue == Dialogo05) {
            start_choice(_QSF05);
        }
        else if (current_dialogue == _QSF05.S || current_dialogue == _QSF05.N) {
            global.conhecido = true;
            salvar_progresso();

            if (global.pontos >= 2) {
                start_dialogue(Fim01_Sucesso, true);
            } else {
                start_dialogue(Fim02_Neutro, true);
            }
        }
        else if (current_dialogue == Fim01_Sucesso || current_dialogue == Fim02_Neutro) {
            state = DIALOGUE_STATE.EXITING;
        }
        else if (current_dialogue == Version02_1_Bloqueado) {
            bloquear_jogador();
        }
        else if (current_dialogue == Version02_2_Intro || current_dialogue == Version02_2_Reencontro) {
            start_choice(_QSV02);
        }
        else if (current_dialogue == _QSV02.S || current_dialogue == _QSV02.N) {
            start_dialogue(Dialogo06, true);
        }
        else if (current_dialogue == Dialogo06) {
            start_choice(_QSV03);
        }
        else if (current_dialogue == _QSV03.S || current_dialogue == _QSV03.N) {
            start_dialogue(Dialogo07, true);
        }
        else if (current_dialogue == Dialogo07) {
            start_choice(_QSV04);
        }
        else if (current_dialogue == _QSV04.S || current_dialogue == _QSV04.N) {
            global.cor_texto_chat = c_red; 
            travar_no_final = true;
            som_tocado = true;
            
            global.bloqueado = true;
            salvar_progresso();
			
			
            
            state = DIALOGUE_STATE.EXITING;
        }
        break;

    case DIALOGUE_STATE.EXITING:
        tempo_encerrando += 1;
        if (tempo_encerrando >= 120) {
            game_end();
        }
        break;
}