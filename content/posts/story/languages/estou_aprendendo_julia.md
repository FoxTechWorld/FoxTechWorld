---
title: "Estou aprendendo julia"
date: 2023-06-08T22:17:53-03:00
description: "Uma linguagem veloz para a maioria das coisas"

categories:
  - "Technology"
tags:
  - "Programming"
  - "Studying"
author: "KitsuneSemCalda"
comments: true
authorbox: true
mathjax: true
---

Como [Uncle Bob diz: "Learn at least one new language every year"](https://blog.cleancoder.com/uncle-bob/2016/09/01/TheLurn.html) e eu decidi começar a estudar [Julia](https://www.youtube.com/watch?v=JYs_94znYy0&t=23s&ab_channel=Fireship) por ela poder ser utilizada a fins de simulação e visualização de dados, inclusive criei um repositorio github para [meus aprendizados](https://github.com/KitsuneSemCalda/Learning) onde pretendo deixar algumas coisas que aprendi como linguagens conceitos e etc. Para isto funcionar da forma que espero vou utilizar da ajuda do ChatGPT e do gpt4all para me gerar desafios e prompts de aprendizado inclusive o primeiro prompt que eu dei foi: `Se imagine sendo o professor mais didatico da internet e crie um tutorial com exercicios em julia`.
A resposta foi simples, objetiva e direta o suficiente para eu conseguir fazer os exercícios sem ler a documentação "Calma aaeeeeh eu vou ler a documentação quando já tiver uma boa base de entendimento" mas antes preciso engatinhar para ver se faz sentido continuar na linguagem ou se ela se torna muito exótica para mim e graças a minha sorte ela não me entediou nas primeiras linhas de aprendizado então consigo seguir de boa.
Primeira coisa que devo dizer sobre o ChatGPT, ele não gerou explicações descentes o suficiente para se considerar um substituto de documentação, apenas mostrou exemplos para um idiota a.k.a eu seguir.

###### Variáveis e Operações Básicas
```julia
# Declaração de variáveis
x = 10
y = 5.0
nome = "Julia"

# Operações básicas
soma = x + y
subtracao = x - y
multiplicacao = x * y
divisao = x / y
potencia = x ^ 2

# Exibindo resultados
println("A soma de x e y é ", soma)
println("A potência de x é ", potencia)
```

###### Estruturas de Controle
```julia
# Condicionais
x = 10

if x > 5
    println("x é maior que 5")
elseif x < 5
    println("x é menor que 5")
else
    println("x é igual a 5")
end

# Loops
for i in 1:5
    println("Iteração ", i)
end

i = 1
while i <= 5
    println("Iteração ", i)
    i += 1
end
```

###### Funções

```julia
# Função que calcula o quadrado de um número
function calcular_quadrado(x)
    return x ^ 2
end

# Chamando a função
resultado = calcular_quadrado(5)
println("O quadrado de 5 é ", resultado)
```

Como podem ver, exemplos demostrativos simples e sem multa explicação atuando somente sobre o essencial diferente do vídeo do Fireship indexado acima. Muita coisa foi omitida e muita coisa foi simplesmente não explicada mas com isso consigo concluir todos os exercicios que o ChatGPT me deu para treinar sendo eles:

###### Exercicios
- Escreva uma função em Julia que calcule a média de três números.
- Escreva um programa que imprima os números pares de 1 a 10.
- Escreva uma função em Julia que verifique se um número é primo.
- Crie uma lista (array) de números e escreva um programa para calcular a soma dos elementos dessa lista.
- Escreva uma função em Julia que inverta uma string.

Todos os exercicios foram concluídos no repositório Learning e está disponivel para leitura, agora o que podemos tirar disso primeiro que a sintaxe de Julia é similar a de ruby/lua, o ChatGPT precisa de mais especificação para fazer ensino sobre coisas e terceiro sempre tente aprender uma nova linguagem. Você não é sua linguagem de programação logo você é além dela.

Você necessita de ferramentas, um arquiteto / designer / pedreiro ou qualquer outra profissão que você tentar precisa das suas ferramentas e como desenvolvedor você não é diferente entenda você se tornou um [Body of Knowledge](https://en.wikipedia.org/wiki/Body_of_knowledge) um estado de conhecimento onde não importa a ferramenta e o procedimento você vai conseguir resolver.

Aprenda uma nova linguagem, aprenda a digitar, aprenda um banco de dados ... aprenda a aprender e tudo no fim se resumi a isso `aprender` assim sendo, vou continuar meu processo de busca pelo aprendizado da linguagem julia e vou atualizando vocês no processo.
