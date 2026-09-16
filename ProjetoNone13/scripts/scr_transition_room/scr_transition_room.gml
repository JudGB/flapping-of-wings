/// @function scr_transition_room(room_destination, delay_seconds)
function scr_transition_room(_room, _delay = 0)
{
    if (instance_exists(obj_transition))
    {
        with (obj_transition)
        {
            if (transition.state != TRANSITION_STATE.IDLE) exit;
            
            transition.room = _room;
            transition.alpha = 0;
            transition.delay = round(_delay * game_get_speed(gamespeed_fps));
            
            if (transition.delay > 0)
                transition.state = TRANSITION_STATE.WAIT;
            else
                transition.state = TRANSITION_STATE.FADE_OUT;
        }
    }
    else
    {
        // Se o obj_transition não estiver na sala, troca diretamente
        room_goto(_room);
    }
}