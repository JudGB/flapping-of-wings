function scr_QuestText(Title, Loc = false, align = undefined, PosX, PosY, effect, Input, Room = undefined, Room2 = undefined)
{
	
	scribble($"[f_TelaInic][c_white]{Title}[/c_white]").align(align).draw(PosX + 45, PosY - 150)
	if Loc = false
	{
		if (value == 0)
		{
			scribble($"[f_TelaInic][c_white]Não[/c_white]").align(align).draw(PosX + 100, PosY);
			draw_set_colour(c_white)
			scribble($"[f_TelaInic][c_yellow]Sim[/c_yellow]").align(align).draw(PosX, PosY);	
		}
		else{
			scribble($"[f_TelaInic][c_yellow]Não[/c_yellow]").align(align).draw(PosX + 100, PosY);
			scribble($"[f_TelaInic][c_white]Sim[/c_white]").align(align).draw(PosX, PosY);
		}
	
		if keyboard_check_pressed(Input){
			if(value == 0)
			{
				scr_transition_room(Room2, 0.5);
		
			}
			if(value == 1)
			{
	
				scr_transition_room(Room, 0.5); // Inicia a transição
				
			}
	
		}
	}
	else{
		if (value == 0)
		{
			scribble($"[f_TelaInic][c_white]Simmmmmmmmmmmmmmmmmmmmm[/c_white]").align(align).draw(PosX + 200, PosY);
			scribble($"[f_TelaInic][c_white]Sim[/c_white]").align(align).draw(PosX + 100, PosY);
			scribble($"[f_TelaInic][c_yellow]Sim[/c_yellow]").align(align).draw(PosX, PosY);	
		}
		if (value == 1)
		{
			scribble($"[f_TelaInic][c_white]Simmmmmmmmmmmmmmmmmmmmm[/c_white]").align(align).draw(PosX + 200, PosY);
			scribble($"[f_TelaInic][c_yellow]Sim[/c_yellow]").align(align).draw(PosX + 100, PosY);
			scribble($"[f_TelaInic][c_white]Sim[/c_white]").align(align).draw(PosX, PosY);	
		}else{
			scribble($"[f_TelaInic][c_yellow]Simmmmmmmmmmmmmmmmmmmmm[/c_yellow]").align(align).draw(PosX + 200, PosY);
			scribble($"[f_TelaInic][c_white]Sim[/c_white]").align(align).draw(PosX + 100, PosY);
			scribble($"[f_TelaInic][c_white]Sim[/c_white]").align(align).draw(PosX, PosY);	
		}
	
		if keyboard_check_pressed(Input){
			if(value == 0)
			{
				show_debug_message("Sim")
		
			}
			if(value == 1)
			{
				show_debug_message("Sim")
			}
			if(value == 2)
			{
				show_debug_message("Simmmmmmmmmmmmmmmmmmm")
			}
	
		}
	}

	if keyboard_check_pressed(vk_left)
	{
		value++;
		if(value > 1){
			value = 0
		}	
	}
	if keyboard_check_pressed(vk_right)
	{
		value--;
		if(value < 0){
			value = 1
		}
	
	}
}
