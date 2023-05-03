---
title: "Usei bash para deployar este site"
date: 2023-04-30T01:06:17-03:00
description: "Criei um script para deployar este site na web"
categories:
  - "Programming"
tags:
  - "Programming"
  - "Technology"
---

Isso mesmo galera, fiz um script bash para gerar o conteúdo que aparece em vossas telas.
Antes de tudo, esse script bash serve apenas para deployar, e todo trabalho duro de converter minhas digitações em html pertence ao [Hugo](https://gohugo.io/)

Enfim, na versão do meu script `deploy.sh`, ele faz tarefas bem simplistas para gerar o html e mandar para o github, que por sua vez manda para o github pages.
Simples por enquanto, até a hora da minha maldade começar.

na verdade, o trabalho é bem simples para o script

ele é dividido em 3 funções

- Gerar o html
- Postar o html em github pages
- Postar as modificações no repo

Para a primeira etapa eu fiz o seguinte:

```bash
commit="no message for this commit"
[[ "${1}" ]] && commit=${1}
hugo
```

Isso verifica se há uma messagem de commit, caso não haja cria uma mensagem generica após isso gera o html
Bem simples e prático, e o melhor sem grandes dores de cabeça.

Para a segunda etapa começamos com a primeira função:
```bash
function public_deploy(){
  cd public
  git add .
  git commit -m "${commit}"
  git push origin main
}
```

Uma função simples que vai deployar dentro do submodule do site, ela apenas entra em `public` que é o submódulo do blog.
adiciona tudo e faz o commit com a mensagem da primeira etapa. Após isso empurra pro submódulo.

Para a terceira etapa fazemos o mesmo para o repo em que estou trabalhando neste momento.

```bash
function repo_deploy(){
  cd ..
  git add .
  git commit -m "$commit"
  git push origin main
}
```

Nem vou perder tempo explicando este, é apenas a segunda etapa feita no repo anterior

Para a quarta etapa, integramos tudo e usamos uma sequencia de funções.

```bash
function deploy(){
  public_deploy;
  repo_deploy
}

function start(){
  deploy
}

start
```

Isso parece comprido e nem um pouco pratico agora pois eu to rebolando demais em volta do deploy no momento.
Mas futuramente o script será ampliado para otimização de imagens e outros.
