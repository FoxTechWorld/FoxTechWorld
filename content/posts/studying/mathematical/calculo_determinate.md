---
title: "Calculo inversa de uma matriz de forma eficiente"
date: 2023-06-11T16:10:06-03:00
description: "Tá cansado de calcular a inversa da matriz usando sistemas lineares igual um animal?"
author: "KitsuneSemCalda"
categories:
  - "Mathematical"
  - "Tecnology"

tags:
  - "Studying"


comments: true
authorbox: true
mathjax: true
---

### O que é necessário para calcular a inversa

Para calcular uma inversa precisamos de 3 coisas.

1. Uma matriz quadrada
2. A determinante dessa matriz
3. Algo ou alguém para calcular isso

`" ¯\_(ツ)_/¯ "`

### Como calcular a inversa com velocidade sem gastar muito esforço

Na verdade é são poucos passos:

- Pegue uma matriz quadrada e inverta a ordem da diagonal principal

```
| 2 4 | -> | 5 4 |
| 1 5 | -> | 1 2 |
```

- Inverta o sinal da diagonal secundária

```
|  5 -4 |
| -1  2 |
```

- Você divide todos os elementos da matriz gerada pelo determinante da matriz original e reduz onde é possível.

```
|  5/6 -4/6 | -> |  5/6 -2/3 |
| -1/6  2/6 | -> | -1/6  1/3 |
```
