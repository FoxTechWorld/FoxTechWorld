---
title: "Começando um novo projeto: Graphene Simulator"
date: 2023-06-10T12:33:00-03:00
description: "Bora fazer simulação e data visualization"
author: "KitsuneSemCalda"
categories:
  - "Technology"
tags:
  - "Programming"
  - "Graphene Simulator"

comments: true
authorbox: true
mathjax: true
---

Pois é, mais um projetinho para passar bem o feriadão, com isso vamos começar a trabalhar com a simulação de eletronicos utilizando [grafeno](https://pt.wikipedia.org/wiki/Grafeno). No caso, eu quero simular algumas objetos que provavelmente queira trabalhar mais tarde:
- [CPU](https://pt.wikipedia.org/wiki/Unidade_central_de_processamento)
- [GPU](https://pt.wikipedia.org/wiki/Unidade_de_processamento_gr%C3%A1fico)
- [Bateria](https://pt.wikipedia.org/wiki/Bateria_(eletricidade))

Para isso vou descontruir um objeto eletronico a seu mínimo e ir gradativamente aumentando, tenha ciencia que para um cpu precisamos seguir o caminho "silicio > transistor > cpu" no caso eu encadearei as structs "grafeno > transistor > cpu" e irei realizar as simulações a base disso. Tome como exemplo essas struct's simplistas

###### Struct para Grafeno
```julia
struct Grafeno
    propriedade1 :: Float64
    propriedade2 :: Float64
    "..."
end
```

###### Struct para Transistor
```julia
struct Transistor
    grafeno::Grafeno
    propriedade1::Float64
    propriedade2::Bool
    "..."
end
```

###### Struct para CPU
```julia
struct CPU
    transistor::Transistor
    propriedade1::String
    propriedade2::Int
    "..."
end
```

Claro que algumas informações foram omitidas para que eu pudesse refletir melhor sobre o que colocar, como simular ... etc. A verdade é que nem nesse exemplo besta eu deveria estar usando float mas provavelmente vou consertar a cagada e trabalhar com int. Caso você não saiba o porque não se deve trabalhar com float assista esse [vídeo](https://youtube.com/channel/UCQgxZQvhH-ybiQmwLMi9Yew). Com isso definido eu tenho que pensar numa forma de encadear as informações para que os dados sejam gerados dinamicamente, provavelemente uma função create_cpu que realize os calculos e gere os dados finais.
Mas as ideia é encadear a criação de novos componentes complexos? Exatamente a ideia principar é ter funções auxiliares que calculam a partir da base o `grafeno` as configurações do `transistor` que levam ao `cpu` de forma encadeada com formulas alterando dinamicamente os valores de cada struct.

E por fim usar um [heatmap](https://pt.wikipedia.org/wiki/Mapa_de_calor) para mostrar o valores.

![heatmap](https://www.displayr.com/wp-content/uploads/2018/09/rat-burrough-heatmap-1.png) 

Ou um gráfico plot simples no formato de [gráfico de linha](https://pt.wikipedia.org/wiki/Gr%C3%A1fico_de_linha).

![Plot](https://exceleasy.com.br/wp-content/uploads/2023/01/Grafico-de-linhas-no-Excel.png).

Em ordem, o plano é começar definindo as propriedades do grafeno e gerar uma struct transistor que utilize as propriedades do grafeno com base para gerar dinamicamente os valores. Em seguida utilizar os dados do transistor como base para matematica gerar valores para a struct CPU / GPU / Bateria, e usar calculos que estressam a "CPU" / "GPU" e "Bateria" para gerar a plot final com os dados. Felizmente alguns dados podem ser assincronamente gerados utilizando `Task` então não deve ficar muito lento.

Com isso eu devo consigo tirar dados suficiente para verificar se o grafeno vale a pena ser esplorado
