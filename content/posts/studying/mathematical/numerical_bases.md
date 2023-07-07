---
title: "Bases Númericas: Binários e Decimais"
date: 2023-05-20T13:08:25-03:00
description: "O mundo indo além de bases decimais com bases binárias"
author: "KitsuneSemCalda"
categories:
  - "Mathematical"
  - "Tecnology"

tags:
  - "Studying"

comments: true
authorbox: true
mathjax: true
[sitemap]
  changefreq = 'weekly'
  priority = 0.5
---

### O que são bases númericas?

Bases numericas são sistemas que nos permitem representar e manipular números de diferentes formas.

Muito além de usar apenas simbolos de 0 a 9 antes de adicionar uma casa decimal, existem outras bases.

Essas outras bases que utilizam símbolos e regras distintas.

### Sistema Decimal

O sistema decimal uma representação posicional em que cada digito tem uma posição especifico.

| primeiro elemento | segundo elemento | terceiro elemento | quarto elemento | extenso |
|---------------- | --------------- | --------------- | --------------- | -------------- |
| 1 | 0 | 0 | 0 | Mil |
| 0 | 2 | 0 | 0 | Duzentos |
| 0 | 0 | 3 | 0 | Trinta |
| 0 | 0 | 0 | 9 | Nove  |

Esse sistema é baseado no conceito de contar que nos permite utilizar operações basicas como adicão, subtração, multiplicação e divisão.

Através da familiaridade com o sistema decimal podemos ter intuitivamente compreensão das quantidades e dos valores numéricos.

### Sistema Binário

O sistema binário é uma base númerica fundamental na computação e na eletrônica.

Diferente do sistema decimal onde possuimos 10 simbolos indo de (0 a 9), o sistema binário só possui dois simbolos 0 e 1.

Esses simbolos representam a existencia ou ausencia de energia respectivamente.

No sistema binário, os valores também são definidos posicionalmente com cada posição sendo correspondente a uma potencia de dois.

| primeiro elemento |	segundo elemento |	terceiro elemento |	quarto elemento | valor decimal |
|---|----|---|---|------------------------------------------------------------------------------|
|0	|0	|0	|0	|0|
|0	|0	|0	|1	|1|
|0	|0	|1	|0	|2|
|0	|0	|1	|1	|3|

### Conversão entre bases decimal e binária: Binário para Decimal

A conversão de um número binário para decimal envolve a determinação do valor decimal correspondente à sequencia de digitos binários.

Cada digito binário em uma posição especifica representa uma potência de 2. 

**Exemplo com o binário 1010 = 1010**

```
(1 * 2³) + (0 * 2²) + (1 * 2¹) + (1 * 2⁰) = 8 + 0 + 2 + 0 = 10.
```

- Identificar a sequência de dígitos binários que deseja converter.

- Atribuir a cada dígito binário uma posição específica, começando da direita para a esquerda.

- Determinar o valor posicional de cada dígito binário, considerando as potências de 2.

- Multiplicar cada dígito binário pelo valor posicional correspondente.

- Somar os resultados das multiplicações para obter o valor decimal equivalente.

### Conversão entre bases decimal e binária: Decimal para binário

De forma oposta, a conversão de um número decimal para binário é um processo que envolve a representação do número decimal em termos de potencias de 2.

Para converter um número decimal em binário, divide-se o número decimal sucessivamente por 2 e registra o resto de cada divisão.

Em seguida, os resto de cada divisão são lidos de trás para frente para obter a representação binária.

**Exemplo de conversão de 25 para binário:**

```
Passo 1: Dividimos 25 por 2 => Quociente 12 e resto 1
Passo 2: Dividimos 12 por 2 => Quociente 6 e resto 0
Passo 3: Dividimos 6 por 2 => Quociente 3 e resto 0
Passo 4: Dividimos 3 por 2 => Quociente 1 e resto 1
Passo 5: Dividimos 1 por 2 => Quociente 0 e resto 1

Passo 6: Invertemos o resto e temos: 11001
```

Olha que interessante, podemos reduzir todo esse processo para a seguinte equação:
\\[ x = \sum_{i=0}^{M} m_{i+1} \cdot n^i \\]
