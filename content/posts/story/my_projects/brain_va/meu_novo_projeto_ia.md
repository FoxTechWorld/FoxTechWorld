---
title: "Meu novo projeto Brain VA"
date: 2023-05-04T11:03:04-03:00
description: "Meu projeto de auxilio para criação de Assistente Virtuais"
author: "KitsuneSemCalda"

categories:
  - "Tecnology"
tags:
  - "Programming"
  - "Brain VA"

comments: true
authorbox: true
mathjax: true

sitemap:
  changefreq: 'weekly'
  priority: 0.5
---

Essa tarde tive uma ideia sobre como tornar um Virtual Assistente um pouco mais esperto sem necessariamente precisar de uma IA treinada.
Vamos criar um projeto que gerar uma fonte de conhecimento para IA ou buscas rápidas para chatbot, seria necessario ter um chatbot implementado de forma unica para esse ferramenta, mas por enquanto do jeito que vamos fazer parece bom.

### Criando os objetivos

Primeiramente eu dividi a primeira parte da ideia em etapas:

    - Raspar Dados do Wikipedia ... [Podemos adicionar outras plataformas de conteúdo futuramente]
    - Usar a api da openai (GPT 3.5 turbo) para dividir o artigo em fatos e regras de prolog
    - Salvar esses fatos e regras em um diretório separado com código fonte de prolog

Agora para a segunda etapa podemos criar uma api em golang que comunique com esses binários a outros softwares

Dessa forma podemos ter um sistema de pergunta e resposta mais simples, e usar tratamento de erro para coisas desconhecidas serem pesquisadas e adicionadas ao sistema depois recompilado e executando em ordem.

Pretendo fazer mais posts implementando esse sistema mais para frente e possivelmente criando meu VA.

- [Primeiro Passo](https://foxtechworld.github.io/2023/05/o-primeiro-passo-para-o-brain-va/)
