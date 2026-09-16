//Iniciando instâncias//

global.Music_volume = 1;
global.volume = 1;
force = noone //Vai servir com a ajuda da barra movel a regular e aumentar os sons
delay = 0


Roomm = room == rm_TelaInicial


// Carrega o grupo na memória do jogo
if (!audio_group_is_loaded(audiogroup_SFX)) {
    audio_group_load(audiogroup_SFX);
}

// Carrega o grupo na memória do jogo
if (!audio_group_is_loaded(audiogroup_musica)) {
    audio_group_load(audiogroup_musica);
}

// Guarda a instância da música do jogo tocando em loop
musica_jogo = noone;

