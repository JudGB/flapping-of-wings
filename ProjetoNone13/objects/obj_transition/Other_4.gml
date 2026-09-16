// Quando a nova sala carrega, se a tela estiver totalmente escura (alpha = 1), inicia o Fade In
if (transition.alpha >= 1)
{
    transition.state = TRANSITION_STATE.FADE_IN;
}