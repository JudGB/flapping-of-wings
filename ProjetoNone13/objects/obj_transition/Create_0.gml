enum TRANSITION_STATE
{
    IDLE,
    WAIT,
    FADE_OUT,
    FADE_IN
}

transition =
{
    state : TRANSITION_STATE.IDLE,

    alpha : 0,

    speed : 0.02,

    room : noone,

    delay : 0
};