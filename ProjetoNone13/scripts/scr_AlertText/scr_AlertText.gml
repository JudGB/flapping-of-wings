function scr_AlertText(AlertText = "", align, PosX, PosY, Room)
{
	scr_transition_room(Room, 0.5);
	scribble($"[f_TelaInic][wave]{AlertText}[/wave]").align(align).draw(PosX, PosY);
	
}