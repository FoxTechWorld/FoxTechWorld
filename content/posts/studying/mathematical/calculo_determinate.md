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

sitemap:
  changefreq: 'weekly'
  priority: 0.5
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

\begin{pmatrix}
\displaylines{5 & 4 \\\ 1 & 2}
\end{pmatrix}

- Inverta o sinal da diagonal secundária

\begin{pmatrix}
\displaylines{5 & -4 \\\ -1 & 2}
\end{pmatrix}

- Você divide todos os elementos da matriz gerada pelo determinante da matriz original e reduz onde é possível.

Matrix original:

\begin{pmatrix}
\frac{5}{6} & -\frac{4}{6} \\\ -\frac{1}{6} & \frac{2}{6}
\end{pmatrix}

Matrix inversa:

\begin{pmatrix}
\frac{5}{6} & -\frac{2}{3} \\\ -\frac{1}{6} & \frac{1}{3}
\end{pmatrix}

Espero que tenha ajudado nas provas de matrizes e na implementação de calculos mais eficientes.
