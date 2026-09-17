# flapping of wings (Game Jam)

Este repositório contém o código-fonte de **flapping of wings**, um jogo experimental desenvolvido no período de **uma semana** para uma competição de programação. Por se tratar de uma maratona de desenvolvimento de curto prazo, o projeto foi construído exclusivamente para fins práticos.

## Sobre o Projeto

Com o tempo escasso de uma semana, o foco total do desenvolvimento foi direcionado para a **engenharia e lógica de programação**. Por conta disso, a parte estética e artística do jogo ficou intencionalmente simplificada e inacabada. 

O coração do jogo está na sua **narrativa psicológica construída através de textos** (estilo *text game*). A experiência foi desenhada para desafiar a percepção de quem joga, misturando linhas de diálogo imersivas com comportamentos incomuns do sistema.

## Mecânica Oculta: A IA sabe quem você é?

A principal *feature* de programação testada neste projeto é a sua capacidade de quebrar a quarta parede utilizando **GML (GameMaker Language)**. O jogo interage diretamente com o sistema operacional do usuário de duas formas:

1. **Identificação do Usuário:** O código captura o nome do computador do jogador para usá-lo dentro dos diálogos da inteligência artificial do jogo.
2. **Arquivo de Persistência (`.temp`):** O script cria silenciosamente um arquivo temporário no computador de quem joga. Em um determinado momento, a IA perguntará se você já a conhece. Se você mentir dizendo que é a sua primeira vez, a IA fará uma varredura no sistema, lerá o arquivo oculto e **descobrirá que você está mentindo**.

> ⚠️ *Você tem certeza de que limpou os rastros do jogo antes de abrir o código? A IA pode estar observando o seu sistema agora mesmo.*

## Demonstração Visual

<p align="center">
  <img src="https://github.com/JudGB/flapping-of-wings/blob/main/Assets/Imagens/screenshotgame.png" alt="Interface Textual do Jogo" width="500" />
</p>

## Tecnologias e Conceitos Aplicados

Como o objetivo era vencer o relógio da competição, o desenvolvimento focou em lógica pura aplicada no ecossistema do GameMaker:

* **GML (GameMaker Language):** Linguagem utilizada para estruturar os scripts de leitura e escrita de dados locais.
* **Manipulação de Arquivos (File I/O):** Criação e verificação de arquivos persistentes no armazenamento local (`sandbox` ou diretórios locais do usuário) para controle de estados de jogo (*Save oculto*).
* **Variáveis de Ambiente:** Captura de metadados do sistema operacional (como o nome do dispositivo) para integração dinâmica de strings de texto.
* **Narrativa Ramificada Condicional:** Lógica estruturada em árvores de decisões baseada na checagem de arquivos locais existentes para mudar o humor e as respostas da IA.

## Estrutura de Arquivos

O projeto está organizado na seguinte árvore de diretórios:

```text
├── ProjetoNone13/          # Arquivos de código-fonte, scripts GML e dependências do jogo
├── .gitattributes          # Configurações de atributos do repositório
└── README.md               # Documentação do projeto
```

## Como Testar o Jogo Localmente

Para rodar o projeto na sua máquina e investigar o código, siga os passos abaixo:

1. **Clone o repositóri:**
   ```bash
   git clone https://github.com/JudGB/flapping-of-wings
   ```
2. **Acesse a pasta do projeto:**
   ```bash
   cd flapping-of-wings
   ```
3. **Abra o projeto:**
   Importe a pasta do projeto dentro do seu software **GameMaker** para analisar os scripts de manipulação de arquivos ou rodar o executável gerado.

## Considerações Finais

Este projeto foi desenvolvido por **Judson** como um desafio de programação rápida e estudo de imersão textual. Ele serve como prova de conceito de que mecânicas inovadoras de interação com o sistema e uma boa escrita podem criar mistério e tensão real, mesmo sem recursos visuais avançados.
