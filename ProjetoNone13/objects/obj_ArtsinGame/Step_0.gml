// Mantém a variável sincronizada com o que o jogador digita
if (string_length(keyboard_string) <= limite_caracteres) {
    texto_digitado = keyboard_string;
} else {
    keyboard_string = texto_digitado; // Impede passar do limite
}

// Se o jogador apertar ENTER, confirma o input
if (keyboard_check_pressed(vk_enter)) {
    show_message("Você digitou: " + texto_digitado);
    // Aqui você usa o 'texto_digitado' para o que precisar no jogo!
}

