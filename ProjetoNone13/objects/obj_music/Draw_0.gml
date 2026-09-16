// 1. Desenha o fundo da barra (Cinza Escuro)
draw_set_color(c_black);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

// 2. Desenha o preenchimento até o volume atual 
draw_set_color(c_gray);
draw_rectangle(bar_x, bar_y, bar_x + (Music_volume * bar_width), bar_y + bar_height, false);

// 3. Desenha o botão indicador (Círculo Branco)
var button_x = bar_x + (Music_volume * bar_width);
var button_y = bar_y + (bar_height / 2);

draw_set_color(c_white);
draw_rectangle(button_x - 12, button_y - 12, button_x + 12, button_y + 12, false);

draw_set_color(c_dkgrey);
draw_rectangle(button_x - 7, button_y - 7, button_x + 7, button_y + 7, false);
// 4. Desenha a borda da barra (Branca)
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, true);