function scr_transition_busy()
{
    return obj_transition.transition.state != TRANSITION_STATE.IDLE;
}