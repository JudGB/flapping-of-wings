if (transition.state != TRANSITION_STATE.IDLE)
{
    draw_set_alpha(transition.alpha);

    draw_set_color(c_black);

    draw_rectangle(
        0,
        0,
        display_get_gui_width(),
        display_get_gui_height(),
        false
    );

    draw_set_alpha(1);
}

