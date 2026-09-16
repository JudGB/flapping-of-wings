#region Sounds

// A barra do sound
var _resultado = scr_MangerAud(bar_x, bar_y, bar_width, bar_height, volume, arrastando, true); 

// Atualiza as variáveis do objeto para o próximo frame
arrastando   = _resultado[0]; // Pega o Arst atualizado
volume       = _resultado[1]; // Pega o Vol atualizado


#endregion

#region Music

//A barra do music
var _resultado2 = scr_MangerAud(Mbar_x, Mbar_y, Mbar_width, Mbar_height, Music_volume, Marrastando, true, audiogroup_default);

// Atualiza as variáveis do objeto para o próximo frame
Marrastando   = _resultado2[0]; // Pega o Arst atualizado
Music_volume  = _resultado2[1]; // Pega o Vol atualizado



#endregion