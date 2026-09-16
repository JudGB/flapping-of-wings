// Desenha a caixa de texto e o texto dentro
draw_self(); // Desenha o sprite da caixa (se houver)
draw_set_color(c_white);
draw_text(x + 10, y + 10, texto_digitado);

//draw_text(300, 300, $"Spd = 2.5;\nGrav = 1.5;\nMoney = {Value}")