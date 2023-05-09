---
title: "Me inscrevi para testar a linguagem mojo"
date: 2023-05-08T21:06:52-03:00
description: "Mojo a nova linguagem para desenvolvimento de inteligencias artificiais"

categories:
  - "Tecnology"
tags:
  - "Programming"

comments: true
authorbox: true
---

Galera, me inscrevi na lista para testar a nova linguagem de progmamação Mojo, que segundo eles é a combinação perfeita entre a usabilidade do python com a performance do C.
Eu particularmente gosto do C por ser uma metaprogramação em baixo nível misturado com performance, não que eu tenha algo contra python ou outras linguagens. 
Inclusive python é uma das minhas linguagens favoritas talvez eu faça um post sobre cada linguagem e porque eu goste delas.

Primeiramente, a linguagem Mojo é compativel com o Python, eles utilizam o cpython para executar todo o código python existente garantindo sua total compatibilidade com o ecossistema python. 

Mas, como o objetivo da linguagem é ter desempenho similar ao de baixo nível, [eles](https://www.modular.com/) adicionaram suporte a capacidade de implementar subconjunto de aceleradores.

O Mojo apesar de ser uma nova base de código, ele não está começando conceitualmente do zero. A adoção do CPython simplifica enormemente os esforços em design da linguagem então a Modular precisa especificamente trabalhar no compilador e nos recursos da linguagem, inclusive eles aproveitam o uso de outras linguagens como Clang, Rust, Julia, Zig, Nim ... etc, e do ecossistema de compilador MLIR.

Outra coisa interessante no paper inicial do Mojo é que sua ideia principal é criar um superconjunto de Python com a linguagem mojo sendo compativel com os programas existentes, eles esperam que para um programador python o Mojo seja instantaneamente familiar ao mesmo tempo que oferece novas ferramentas  para se trabalhar com o mesmo.

O mojo já suporta alguns recursos básicos do python como:   

- Async/Await
- Tratamento de Erros
- Variadics "Tenho que reestudar sobre isso, não me lembro de ter passado sobre"
... etc. 

Ainda é cedo e falta recursos, então não é muito compativel ainda.

O mojo também possui diferenças intencionais com o python. E apesar de buscarem ter compatibilidade com o mesmo eles também querem que o Mojo seja uma linguagem de alta classe, então o mesmo possui uma abordagem de compatibilidade dupla:

- Utilizar o cpython para executar todo o código python3 existente e "pronto para uso" sem modificação para ter compatibilidade total com todo o ecossistema. 

Uma execução mais simples sem nenhuma vantagem ou beneficio a linguagem mojo mas contendo total disponibilidade ao ecossistema python.

- Fornecer um migrador mecânico que fornece compatibilidade muito boa para converter o código python para código mojo. 

Por exemplo, o mojo fornece recurso de backtick que fornece o uso de uma palavra chave como um identificador? "porque eu não sei mas parece estranho usar if, break ... como identificador de algo"  

Somente com esse inicio na documentação do mojo, já meu uma vontade enorme de testar a linguagem literalmente estou babando com a ideia de um superconjunto python para desenvolvimento de sistemas inclusive linguagens artificiais usando alta performance. Enquanto aguardo na espera para o teste da linguagem mojo, deixo o link de como entrar na whitelist para brincar com o mesmo.

[Mojo Whitelist](https://www.modular.com/mojo)
