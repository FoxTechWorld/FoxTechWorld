---
title: "Pseudo random number"
date: 2023-05-04T08:39:04-03:00
description: "Como são gerados números pseudo aleátorios"
categories:
  - "Mathematical"
  - "Tecnology"
tags:
  - "Mathematical"
  - "Pseudo Random"
---

Um número verdadeiramente aleátorio é impossivel com a computação porque a computação é deterministica.
Ou seja, eu posso saber e conferir o resultado antes mesmo dele executar ou testar para o resultado.

Com isso operamos algoritmos matématicos repetiveis. Para trabalharmos com números continuos e variantes uma (seed).
Essa seed pode ser o tempo, a quantidade de memória, o ping da rede, ou tudo isso com diversas operações para aumentar a entropia.

A maioria dos algoritmos de números pseudo-aleatórios são geralmente projetados para produzir sequências que parecem aleatórios, mas não são verdadeiramente aleatórios.

| Lista de Algoritmos para gerar números pseudo-aleatórios |
|----------------------------------------------------------|
| LCG (Linear Congruential Generator)                      |
| Mersenne Twister                                         |
| XOR Shift                                                |
| Blum Blum Shub                                           |
| Park-Miller-Carta                                        |
| Middle Square Method                                     |
| Additive Feedback                                        |

Inclusive John von Neumann criou o conceito de uma sequencia quase aleatória que é uma sequencia obviamente não aleatória, mas exibe comportamento estatisticamente similar a um número aleátorio.

Algumas vezes usamos hash para misturar os bits da semente e aumentar a entropia

**Porque a soma de dois números aleatórios ou pseudo-aleatórios não aumenta a aleatoriedade**

Com tudo isso dito sobre a geração de números pseudo-aleatórios. Tenha o seguinte o exemplo:

1. Suponha que você está gerando números aleatórios de 0 a 1 usando um gerador de números aleatórios verdadeiros (digamos, jogando uma moeda várias vezes) e que a sequência resultante é a seguinte:

0.1 0.8 0.4 0.3 0.9

2. Agora, considere uma segunda sequência, gerada usando um gerador de números pseudoaleatórios com uma semente específica:

0.2 0.5 0.7 0.1 0.4

Se você somar as duas sequências, a sequência resultante será:

0.3 1.3 1.1 0.4 1.3

Note que a soma introduziu um padrão, com valores repetidos aparecendo em várias posições. 

Este padrão não estava presente nas sequências originais.

Em geral, introduzir novos padrões não é recomendado para aumentar a aleátoriedade, pois não melhora a distribuição de probabilidade de números gerados.

Matematicamente falando, a soma de números aleatórios estariamos trabalhando com uma operação deterministica onde não haveria nada de aleátorio.
