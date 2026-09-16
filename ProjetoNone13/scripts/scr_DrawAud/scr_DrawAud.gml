/*

PosX   = bar_x
PosY   = bar_y
BarW   = bar_width
BarH   = bar_height
Vol    = Volume
Arst   = Arrastando
Group  = audiogroup do audio

*/

function scr_DrawAud(PosX, PosY, BarW, BarH, Vol)
{
	
	// 1. Desenha o fundo da barra (Cinza Escuro)
	draw_set_color(c_black);
	draw_rectangle(PosX, PosY, PosX + BarW, PosY + BarH, false);

	// 2. Desenha o preenchimento até o volume atual 
	draw_set_color(c_gray);
	draw_rectangle(PosX, PosY, PosX + (Vol * BarW), PosY + BarH, false);

	// 4. Desenha a borda da barra (Branca)
	draw_rectangle(PosX, PosY, PosX + BarW, PosY + BarH, true);

	// 3. Desenha o botão indicador (Círculo Branco)
	var button_x = PosX + (Vol * BarW);
	var button_y = PosY + (BarH / 2);

	draw_set_color(c_white);
	draw_rectangle(button_x - 12, button_y - 12, button_x + 12, button_y + 12, false);

	
}