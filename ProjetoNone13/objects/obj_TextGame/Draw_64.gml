if !room=rm_TelaInicial exit;
scribble($"[f_TelaInic]Production by [wave][rainbow]juju[/rainbow][/wave]").align(fa_right).draw(1270,650);
draw_set_colour(c_white)

for(var i=0;i<op_max;i++){
	
	if(index==i){
		scribble($"[f_TelaInic][pulse][c_yellow]{opcoes[i]}[/c_yellow][/pulse]").scale(2).align(fa_center).draw(room_width/2,250 + (80 * i));
		
	}
	else{
		scribble($"[f_TelaInic][c_white]{opcoes[i]}[/c_white]").transform(1, 1, 0).align(fa_center).draw(room_width/2,270 + (80 * i));	
		
	}
	
}



