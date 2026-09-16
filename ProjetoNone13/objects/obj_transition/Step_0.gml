switch (transition.state)
{
    // -----------------------------------
    // ESTADO 0: PARADO / SEM TRANSIÇÃO
    // -----------------------------------
    case TRANSITION_STATE.IDLE:
    break;

    // -----------------------------------
    // ESTADO 1: ESPERANDO DELAY
    // -----------------------------------
    case TRANSITION_STATE.WAIT:
        transition.delay--;

        if (transition.delay <= 0)
        {
            transition.state = TRANSITION_STATE.FADE_OUT;
        }
    break;

    // -----------------------------------
    // ESTADO 2: ESCURECENDO A TELA (FADE OUT)
    // -----------------------------------
    case TRANSITION_STATE.FADE_OUT:
        transition.alpha += transition.speed;

        if (transition.alpha >= 1)
        {
            transition.alpha = 1;
            
            // TRAVA 1: Muda para IDLE para não chamar room_goto em loop infinito
            transition.state = TRANSITION_STATE.IDLE;
            
            // TRAVA 2: Verifica se a variável de sala realmente existe e é válida antes de trocar
            if (variable_struct_exists(transition, "room") && room_exists(transition.room))
            {
                room_goto(transition.room);
            }
            else
            {
                show_debug_message("AVISO: Nenhuma sala válida foi definida na transição!");
            }
        }
    break;

    // -----------------------------------
    // ESTADO 3: CLAREANDO A TELA (FADE IN)
    // -----------------------------------
    case TRANSITION_STATE.FADE_IN:
        transition.alpha -= transition.speed;

        if (transition.alpha <= 0)
        {
            transition.alpha = 0;
            transition.state = TRANSITION_STATE.IDLE;
        }
    break;
}