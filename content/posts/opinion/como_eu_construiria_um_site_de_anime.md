---
title: "Como eu construiria um site de anime"
date: 2023-07-07T14:34:22-03:00
author: "KitsuneSemCalda"
description: "Como seria um site de anime moderno feito por mim"

categories:
  - "Opinion"
  - "Technology"
tags:
  - "Programming"

comments: true
authorbox: true
mathjax: true

sitemap:
  changefreq: 'weekly'
  priority: 0.5
---

### Disclaimer

Primeiramente, tudo dito aqui eu nunca implementei na prática e estou utilizando meus conhecimentos atuais de tecnologia para `chutar` como seria meu site de animes.

Em segundo lugar, não tenho o menor interesse em construir um site de animes ainda, seria muita burocracia por um projeto que pode ou não dar lucro.

Em terceiro lugar, eu só vim falar do quesito implementação e não de detalhes juridicos e técnicos.

Com isso dito vou começar a explicar como eu construiria um site de anime.

### Motivação para este post

Atualmente estava vendo alguns vídeos sobre inteligencia artificial, bancos de dads, jobs assincronos sendo eles:

- [Jobs Assincronos](https://www.youtube.com/watch?v=Yl-hlwhj2B0)
- [Como fazer o ingresso.com escalar](https://www.youtube.com/watch?v=0TMr8rsmU-k)
- [Devo usar nosql](https://www.youtube.com/watch?v=EdOkYEE1J_Y)
- [Entendendo DevOps Parte1](https://www.youtube.com/watch?v=bwO8EZf0gLI)
- [Entendendo DevOps Parte2](https://youtu.be/mcwnQVAn0pw)
- [Boost your skills with chatgpt](https://www.youtube.com/watch?v=UNGi144eVbI)

### Como eu montaria o site

Vamos começar selecionando uma arquitetura, de forma geral eu prefiro construir um software monolitico em alguma biblioteca rails like apesar de querer experimentar o [Ruby On Rails original](https://rubyonrails.org/), eu usaria o [adonisjs](https://adonisjs.com/) onde eu sou mais acostumado).

Eu começaria usando o nginx como balanceador de carga para conectar diversas pessoas a minha aplicação. De forma geral eu usaria um sistema híbrido de streaming e broadcasting. Para animes da temporada eu adicionaria eles a um serviço de broadcasting (que imitasse a TV) para conseguir assistir em tempo de lançamento fazendo um espelhamento com a TV. Animes que foram de temporadas passadas (ou desta temporada mas após o lançamento do episódio seria distribuida como streaming). 

Para isso eu usaria algumas técnicas de armazenamento e correção com as api's da openAI. Veja eu preciso de várias coisas para fazer um anime novo ser lançando no Brasil de forma gratuita e que todos possam entender, veja o broadcasting é um formato em que a pessoa não tem seleção do que vai aparecer na tela (só a troca de canais) [Sim, um monte de anime em paralelo (com tempo de anuncio a cada 5 min)] imitando uma TV. Para isso precisariamos que todos os animes fossem dublados em tempo real.

Para isso vamos usar um [Faas](https://en.wikipedia.org/wiki/Function_as_a_service) que vai atuar da seguinte forma.

Podemos pegar um anime não editado para o Brasil que esteja no serviço de Block Storage da AWS e enviar pro Faas onde o mesmo teria dublagem e legendas criadas por intelgencia artificial.

E sim, podemos [criar dublagens](https://pt-br.rask.ai/) e [legendas](https://www.youtube.com/watch?v=UNGi144eVbI) em diversas linguas com inteligencia artificial. Apesar de que IA [não é uma inteligencia](https://www.youtube.com/watch?v=O68y0yRZL1Y&ab_channel=FabioAkita) com essas tecnologias em mãos e o poderoso conjunto image magick / ffmpeg podemos construir um site que atue como broadcasting / streaming, que alto legende os novos episódios e que consiga dublar em tempo real baseando - se em sua linguagem nativa.

E como o serviço funciona em diversas localidades podemos adquirir a localização do provedor de internet (sua localização) e distribuir o anime certo para aquela localidade.

### Conclusão

Essa é uma versão bem por cima das coisas que faria lembrando que eu teria que adaptar segurança, contas, escalabilidade ... etc. E isso vendo que eu teria que me tacar no wall garden da Amazon se quiser ter performance em alta escalabildade, o uso de cdn's são muitos detalhes que eu propositalmente omiti para gerar um artigo coeso.

Mas podemos tirar um geral disso:

- Uso de IA's para redublar e legendar em diversas linguas (dublar para versão broadcast e legendar para versão streaming) apesar de eu permitir ver a versão dublada ou legendada na versão streaming e somente dublada na versão broadcasting.
- Uso da AWS para armazenamento da versão original do anime (antes da dublagem // legenda) e de suas versões modificadas para cada país em que o sistema estaria funcionando.
- Uso do NextJS para carregamento estático do site.
- Uso de Faas para automatizar o tratamento de novos episodios e etc...


