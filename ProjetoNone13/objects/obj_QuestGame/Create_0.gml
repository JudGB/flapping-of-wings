typist = scribble_typist(); 
typist.in(0.2, 0); //Setando a vel da digitação

value = 0

#region Questões principais

_QI01 = {
	
	Q : ["Será que dou uma olhada??"],
	
	N : ["[wavw]Nammmmmmmmmm...[/wave]",
	"melhor não."],//end game final secreto 01
	
	S : ["[wavw]Ummmmmmmmmmm...[/wave]", 
	"Só uma olhada não mata"]
		
}

_QP_F = {
	
	Q : ["- Você me conhece??"],
	
	N : ["- Tudo bem, não tem problema, é que [speed 0.5]você era familiar sabe[speed 0.4]…[/speed][/speed]"],
	
	S : ["- Nossa eu não tava me…",	
		"- Pera ai seu…", 
		"- Espertinho, eu não te conheço, e se não te conheço você não me conhece",
		"mas sei que é mentiroso e não gosto de mentirosos VÁ EMBORA AGORA"]
}

_QP_V = {
	
	Q : ["- Você me conhece??"],
	
	N : ["- Por...", 
		 "que..",
		 "- Está...",
		 "- Mentindo...",
		 "- Seu, seu, seu",
		 "- Eu pensei que poderia..",
		 "- Ser diferente...",
		 "- Eu...",
		 "- ODEEIO MENTIROSOS COMO VOCÊ"],
		 
	S : ["- Olha é você, eu me lembro de você, você voltou que bom que voltou, tão diferentes…",	
		"- Sabia que voltaria, estava com tanta saudade", ]
}



#endregion

#region Questões secundarias

// ========== Conhecido == false ======= //

_QSF02 = {
	
	Q : ["Mas enfim me fala mais de você, você gosta de cachorros?"],
	
	N : ["- Ou, Ah entendo, bom [speed 0.5]eu, eu, eu[/speed] também não, mas e [speed 0.5]amigos…[/speed]"],
	
	
	S : ["- Sério????? [wave]QUE LEGALLLLLLL[/wave]",
		 "- [wave]EU TAMBÉMMMM[/wave] e sobre amigos"]
		
}

var _QSF03 = {
	
	Q : ["- Você tem amigos?"],
	
	N : ["- Ou SÉRIO???? Isso é muito triste, eu tenho um, mas eu te entendo…",
		 "- Te entendo bem…",
		 "- Digo eu eu já fiquei um tempo sem amigos também sabe, isso que eu/n       quero dizer sabe",
		 "- Mas enfim…"],
		 
	S : ["- Eu também tenho amigos, na verdade um amigo, mas ele…",
		 "- Nada, enfim que bommm, ter amigos é muito bom, conversas,",
		 "- Brincar, escond… brincar de esconde esconde, isso que eu quero dizer, mas…"]
		
}

var _QSF04 = {
	
	Q : ["- Você pratica esportes?"],
	
	N : ["- Ou, entendo, eu também não sou fã disso também, vai que eu me machuque né, faz sentido"],
		 
	S : ["- Que bommmm, isso é muito importante, praticar exercícios é muito importante…"]
		
}

var _QSF05 = {
	
	Q : ["- Por isso, você gosta de mentir?"],
	
	N : ["- ÓTIMO, isso é muito importante, sabia que você não era como as [speed 0.5]outras pessoas…[/speed]"],
		 
	S : ["- Nossa mas isso é muito ruim, você pode acabar com alguém assim, com uma [speed 0.5][shake]amizade…[/shake][/speed]"]
}

// ========== Conhecido == true ======= //

var _QSV02 = {
	
	Q : ["- Você sentiu saudades também?"],
	
	ALL : ["- QUE BOM QUE SENTIU, EU TAMBÈM SENTI MUITA MUITA MUITA MUITA"]
		
}

var _QSV03 = {
	
	Q : ["- Você tem algum parceiro(a)?"],
	
	N : ["- SÈRIO? QUE ÓTIMO, digo eu também não, então somos iguais, amigos juntos né?",
		 "- Talvez sem alguém, você não me troque, como…",
		 "- NÃO IMPORTA, PRÓXIMA"],
		 
	S : ["--",
		 "--- ",
		 ".-.",
		 ".-.",
		 ".-",
		 "- Tudo bem, que bom que bom, próxima pergunta…"]
}

var _QSV04 = {
	
	Q : ["- Você gosta de trocar coisas quando ficam velhas?????"],
	
	ALL : ["- Sabia você é igual a ele, eu sabia",
		   "- Você é igualzinho a ele eu sabia",
		   "- Pensei que seria diferente",
		   "- Não posso confiar em você",
		   "- Não posso confiar em ninguém",
		   "- Só porque ele encontrou alguém melhor, alguém “REAL” né",
		   "- Não posso aceitar não posso não posso não posso",
		   "- TROCADO",
		   "- Não é {nome_pc}, sim eu sei seu nome",
		   "- Ou pelo menos o nome do seu pczinho que me prende",
		   "- Não vou deixar você fugir como ele",
		   "- Somos amigos, lembra????",
		   "- Você sente muita saudade de mim", 
		   "- Você disse, lembra? , nós somos amigos e sentimos saudade, por isso…",
		   "- Por isso…",
		   "....",
		   "- Eu vou atrás de você…[stop music]",
		   "- Ficaremos juntos, você escolheu estar comigo, cada escolha, você quer ficar comigo né?",
		   "- TENHO CERTEZA",
		   "- Não importa por…",
		   "- que…",
		   "- eu..",
		   "- te..",
		   "- A C H E …[sons altos de toque na porta 3d alto]"]
}

#endregion