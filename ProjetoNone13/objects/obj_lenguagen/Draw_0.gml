// 1. Desenha o fundo da barra (Cinza Escuro)
draw_set_color(c_dkgray);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

// 2. Desenha a borda da barra (Branca)
draw_set_colour(c_white)
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, true);

// 3. Desenha o triangulo de opções
draw_set_colour(c_white)
draw_triangle(50, 50, 0, 0, 0, 0, false);