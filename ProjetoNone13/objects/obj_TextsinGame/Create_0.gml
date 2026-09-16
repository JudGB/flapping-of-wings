// --- CONFIGURAÇÃO DA FONTE E TYPIST ---
global.fonte_dialogo = f_TelaInic;
global.tamanho_fonte = 1;

scribble_font_set_default("f_TelaInic");
typist = scribble_typist();
typist.in(0.2, 0);

// --- ESTADOS DO DIÁLOGO ---
enum DIALOGUE_STATE {
    SPEAKING,
    CHOICE,
    ENDED,
    TRANSITIONING,
    EXITING
}

state = DIALOGUE_STATE.SPEAKING;

// --- PERSISTÊNCIA (.INI) ---
ini_open("save_data.ini");
global.conhecido = ini_read_real("Progresso", "conhecido", false);
global.bloqueado = ini_read_real("Progresso", "bloqueado", false);
ini_close();

// --- VARIÁVEIS DE CONTROLE DO FLUXO ---
chat_history     = [];
is_chat_mode     = false;
dialogue_index   = 0;
current_dialogue = [];
current_choice   = undefined;
selected_option  = 0;

global.stopspeak = false;
global.pontos    = 0;

tempo_encerrando = 0;
texto_encerrando = "...encerrando";
timeskip02_iniciado = false;
musica_jogo = noone;

// --- NOVAS VARIÁVEIS PARA O FINAL DA ROTA 2 ---
global.cor_texto_chat = c_white;
travar_no_final       = false;
som_tocado            = false;

function salvar_progresso() {
    ini_open("save_data.ini");
    ini_write_real("Progresso", "conhecido", global.conhecido);
    ini_write_real("Progresso", "bloqueado", global.bloqueado);
    ini_close();
}

function bloquear_jogador() {
    global.bloqueado = true;
    salvar_progresso();
    state = DIALOGUE_STATE.EXITING;
}

// --- FUNÇÕES DE CONTROLE DE DIÁLOGO E ESCOLHAS ---
function start_dialogue(_array, _is_chat = false) {
    current_dialogue = _array;
    dialogue_index   = 0;
    is_chat_mode     = _is_chat;
    chat_history     = [];
    
    if (array_length(current_dialogue) > 0) {
        checar_sons_dialogo(current_dialogue[0]);
    }
    
    if (is_chat_mode && array_length(_array) > 0) {
        array_push(chat_history, _array[0]);
    }
    
    state = DIALOGUE_STATE.SPEAKING;
    typist.reset();
    typist.in(0.2, 0);
}

function start_choice(_choice_struct) {
    current_choice  = _choice_struct;
    selected_option = 0;
    state           = DIALOGUE_STATE.CHOICE;
}

// Função para checar e disparar os efeitos sonoros das frases de forma leve e precisa
checar_sons_dialogo = function(_texto) 
{
    // Remove tags do Scribble temporariamente apenas para verificar a palavra-chave
    var _texto_limpo = string_lettersdigits(_texto);

    // 1. EFEITO DE PAUSA E VAZIO (Procura por "ELE" ou "Te")
    if (string_pos("ELE", _texto) != 0 || string_pos("Te", _texto) != 0 || string_pos("Porqueseu", _texto_limpo) != 0) 
    {
        if (variable_instance_exists(id, "musica_jogo") && audio_is_playing(musica_jogo)) {
            audio_stop_sound(musica_jogo); // Para totalmente a música do jogo em vez de pausar
        }
        
        // Toca o som de vazio (garante volume audível de fallback caso a variável global falhe)
        var _vol_musica = variable_global_exists("Music_volume") ? global.Music_volume : 1;
        audio_play_sound(snd_Effvazio, 10, false, _vol_musica);
    } 
    
    // 2. EFEITO FINAL DA PORTA ("ACHEI")
    if (string_pos("ACHEI", _texto_limpo) != 0) 
    {
        // Para qualquer áudio que ainda esteja tocando no fundo
        audio_stop_all();

        // Toca o efeito sonoro da porta de forma prioritária (ganho/volume 1)
        var _vol_efeito = variable_global_exists("volume") ? global.volume : 1;
		
		call_later(2,time_source_units_seconds, function(){
		
			audio_play_sound(snd_EffPorta, 100, false, 35);
		});
        
    }
}

// DECLARAÇÃO DE DIÁLOGOS
Dialogo01 = ["Porque o pai guarda essas [wave]coisas . . .[/wave]", "Agora sou eu que vou ter que limpar"];
Dialogo02 = ["Bom vou começar por essa caixa, [wave]mas . . .[/wave]", "o que é essa coisa, ein?"];

_QI01 = {
    Q : "Será que dou uma olhada??",
    N : ["[wave]Nammmmmmmmmm . . .[/wave]", "melhor não."],
    S : ["[wave]Ummmmmmmmmmm . . .[/wave]", "Só uma olhada não mata"]
};

Dialogo03 = ["Olha muitas coisas velhas", "o que é isso?", "[shake]dis..dizisete...disguete[/shake]", "ISSO", "Disquete!", "Como [speed 0.5][wave]usa . . .[/wave][/speed]"];
Dialogo04 = ["Bom nele tá [wave]escrito . . .[/wave]", "Insira em seu IDM 3000", "Eu vi algo com esse nome por aqui cadê", "AQUI!", "Agora só inserir [wave]e . . .[/wave]", "PLAY!"];

Version01_Intro = [
    "- Olá novo jogador, seja bem-vindo a experiência bater das asas!",
    "- Olaaaaaa novo jogador, eu sou a experiência, seja bem vindo ao nosso chat",
    "- Fico feliz em conversar,[speed 0.7] faz tempo que não vejo ninguém . . .[/speed]",
    "- Mas não importa, eu quero saber mais de você, então . . .",
    "- Responda com sinceridade, por que não pode voltar atrás . . ."
];

_QP_V1_01 = {
    Q : "- Você me conhece??",
    N : ["- Tudo bem, não tem problema, é que você era familiar sabe . . ."],
    S : ["- Nossa eu não tava me . . .", "- Pera ai seu . . .", "- Espertinho, eu não te conheço e se não te conheço você [shake][c_red]NÃO ME CONHECE[/c_red][/shake]", "- Mas sei que é mentiroso e não gosto de mentirosos [speed 0.6][shake][c_red]VÁ EMBORA AGORA . . .[/c_red][/shake][/speed]"]
};

_QSF02 = {
    Q : "- Mas enfim me fala mais de você, gosta de cachorros?",
    S : ["- Sério????? [wave]QUE LEGALLLLLLL[/wave]", "- [wave]EU TAMBÉMMMM[/wave] e sobre amigos"],
    N : ["- Ou, Ah entendo, bom eu, eu, eu também não, mas e amigos . . ."]
};

_QSF03 = {
    Q : "- Você tem amigos?",
    S : ["- Eu também tenho amigos, na verdade um amigo, mas ele . . .", "- Nada, enfim que bommm, ter amigos é muito bom, conversas,", "- Brincar, escond . . . brincar de esconde esconde, isso que eu quero dizer, mas . . ."],
    N : ["- Ou SÉRIO???? Isso é muito triste, eu tenho um, mas eu te entendo…", "- te entendo bem . . .", "- Digo eu eu já fiquei um tempo sem amigos também sabe, isso que eu quero dizer sabe", "- Mas enfim . . ."]
};

_QSF04 = {
    Q : "- Você pratica esportes?",
    S : ["- [wave]Que bommmm[/wave], isso é muito importante, praticar exercícios é muito importante . . ."],
    N : ["- Ou, entendo, eu também não sou fã disso também, vai que eu me machuque né, faz sentido"]
};

Dialogo05 = [
    "- Enfim isso é só detalhe, praticar ou não praticar, vai de cada um, não é possível dizer quem é você simplesmente por praticar ou não, mas . . .",
    "- Algo muito importante é, se você cumpre com sua palavra, se quando promete você cumpre",
    "- Na sociedade hoje em dia se encontra em falta isso . . ."
];

_QSF05 = {
    Q : "- Por isso, você gosta de mentir?",
    S : ["- Nossa mas isso é muito ruim, você pode acabar com alguém assim, com uma amizade . . ."],
    N : ["- ÓTIMO, isso é muito importante, sabia que você não era como as outras pessoas . . ."]
};

Fim01_Sucesso = [
    "- Você é engraçado, foi muito bom nossa conversa, espero que volte a falar comigo",
    "- Se eu já te conhecesse antes, [speed 0.7]seria tudo diferente . . .[/speed]",
    "- Espero que volte e diga SIM para mim."
];

Fim02_Neutro = [
    "- Você é meio diferente, um pouco estranho, mas eu não conversava com ninguém a tanto tempo",
    "- Fico feliz por falar comigo."
];

Version02_1_Bloqueado = ["- Olá nov . . .", ". . .", ". . .", "VOCÊ DE NOVO AQUI", "Eu falei", "[speed 0.6][shake][c_red]SEM MENTIROSOS[/c_red][/shake][/speed]"];
Version02_2_Intro = ["- Olá novo jogador, seja bem-vindo a experiência bater das asas!", "- Olaaaaaa novo jogador, eu sou a experiência, seja bem vindo ao nosso chat", "- Fico muito feliz em podermos conversar", "- Então . . .", "- Responda com sinceridade"];
Version02_2_Reencontro = ["- Olha é você, eu me lembro de você, você voltou que bom que voltou, tão diferentes . . .", "- Sabia que voltaria, estava com tanta saudade"];

_QSV02 = {
    Q : "- Você sentiu saudades também?",
    S : ["- QUE BOM QUE SENTIU, EU TAMBÈM SENTI MUITA MUITA MUITA MUITA"],
    N : ["- QUE BOM QUE SENTIU, EU TAMBÈM SENTI MUITA MUITA MUITA MUITA"]
};

Dialogo06 = ["- Desculpa eu me alterei, ninguém nunca tinha voltado . . .", "- Não importa, nada mais importa, nem ele importa . . .", "- Agora que somos amigos próximos, posso te fazer perguntas de amigos próximos como"];

_QSV03 = {
    Q : "- Você tem algum parceiro(a)?",
    S : ["--", "---", ".-.", ".-.", ".-", "- Tudo bem, que bom que bom, [speed 0.6]próxima pergunta . . .[/speed]"],
    N : ["- SÈRIO? QUE ÓTIMO, digo eu também não, então somos iguais, amigos juntos né?", "- Talvez sem alguém, você não me troque, como . . .", "- NÃO IMPORTA, PRÓXIMA"]
};

Dialogo07 = ["- Alguém mora com [speed 0.6]você . . .[/speed]", "- Minha nossa, desculpe essa pergunta não tem sentido né, muito estranha e pessoal", "- [wave]Ehhhhhhhh[/wave], desculpa perguntar isso, [speed 0.7]enfim . . .[/speed]", "- Por que seu [shake][c_red]pa[/c_red][/shake] . . .", "- Meu Deus estou muito velho hahaha", "- Deu pani [wheel]hahahahahahahahahahahahahahahahahahahahahahahaha[/wheel]"];

var _nome_pc = environment_get_variable("USERNAME");
_QSV04 = {
    Q : "- Você gosta de trocar coisas quando ficam velhas?",
    S : [
        "- Sabia você é igual a [shake][c_red]ELE[/c_red][/shake], eu sabia",
        "- Você é igualzinho a [shake][c_red]ELE[/c_red][/shake] eu sabia",
        "- Eu sabia Eu sabia Eu sabia Eu sabia Eu sabia Eu sabia",
        "- Pensei que seria diferente",
        "- Não posso confiar em você",
        "- Não posso confiar em [shake][c_red]NINGUÉM[/c_red][/shake]",
        "- Só porque [shake][c_red]ELE[/c_red][/shake] encontrou alguém melhor, alguém REAL né",
		"- [shake][c_red]ELE[/c_red][/shake][shake][c_red] ELE[/c_red][/shake][shake][c_red] ELE[/c_red][/shake][shake][c_red] ELE[/c_red][/shake][shake][c_red] ELE[/c_red][/shake][shake][c_red] ELE[/c_red][/shake]",
        "- Não posso aceitar não posso não posso não posso ser . . .",
        "- [shake][c_red]TROCADO[/c_red][/shake]",
        $"- Não é [shake]{_nome_pc}[/shake], sim eu sei seu nome",
        "- Ou pelo menos o nome do seu [shake][c_red]P C Z I N H O[/shake][/c_red] que me prende",
        "- Não vou deixar você fugir como [shake][c_red]ELE[/c_red]",
        "- Somos amigos, lembra????",
        "- Você sente [shake][c_red]MUITA SAUDADE[/shake][/c_red] de mim",
        "- Você disse, lembra? , nós somos amigos e sentimos saudade, [speed 0.7]por isso . . .[/speed]",
        "- [speed 0.3]Por isso . . .[/speed]",
        "- [speed 0.3]Por isso . . .[/speed]",
        "- [speed 0.3]. . .[/speed]",
        "- [speed 0.3]. .[/speed]",
        "- [speed 0.3].[/speed]",
        "- Eu vou atrás de [shake][c_red]VOCÊ . . .[/c_red][/shake]",
        "- [shake]Ficaremos juntos, você escolheu estar comigo, cada escolha, você quer ficar comigo né?[/shake]",
        "- [shake]TENHO CERTEZA![/shake]",
        "- [shake]Não importa por . . .[/shake]",
        "- [shake]Que . . .[/shake]",
        "- [shake]Eu . . .[/shake]",
        "- [shake]Te . . .[/shake]",
        "[speed 0.01]A C H E I[/speed]"
    ]
};
_QSV04.N = _QSV04.S;

if (room == rm_TimeSkip01 && global.conhecido) {
    room_goto(rm_TimeSkip02);
}