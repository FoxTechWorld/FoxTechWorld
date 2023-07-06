---
title: "As novas funcionalidades do mojo"
date: 2023-05-12T09:11:26-03:00
description: "O que muda do python para o Mojo?"
author: "KitsuneSemCalda"
categories:
  - "Tecnology"
tags:
  - "Programming"

comments: true
authorbox: true
mathjax: true
---

No post anterior sobre o Mojo, eu contei um pouquinho sobre a linguagem criada pela empresa do Chris Lattner a Modular, e alguns aspectos interessantes da mesma. 
Hoje vou mostrar pontos interessantes que descobri em seu livro interativo sobre a linguagem mojo. "Não consegui logar no PlayGround ainda mas meu nome tá na fila"
Começamos com a ferramenta básica do python para mostrar allgum dado no console.

```python
print("Hello World!)
```

Sim, quando eu disse que Mojo era um superset de python foi justamente sobre isso que eu tava falando. Segundo a espectativa de seu criador a ideia é conseguir importar e usar livremente libs python existetntes e usa-los da forma convencional.
A diferença sendo que o Mojo tem uma grande quantidade de recursos que o Python não possui suporte.

##### Vamos começar com as váriaveis:

Mojo possui suporte a **var** e **let** dentro do sistema.
Dentro de uma função em python, você pode atribuir valores a um nome e isso cria implicitamente uma váriavel de escopo de função.
Isso gera um desafio por dois motivos:

- Programadores de sistemas geralmente desejam declarar um valor que é imutável.
- Programadores de sistemas podem querer obter um erro se digitarem incorretamente o nome de uma váriavel em uma atribuição.

Para combater isso, as novas formas de declaração.

- **let** é uma declaração para uma variável imutável.
- **var** é uma declaração para uma variável mutável.

`Sim, isso lembra o Rust cujo todo valor que é declarado é imutável a menos que você informe o contrário.`

```python
def your_function(a,b):
	let c = a 
	#let c = b # Error: c is imutable
	
	if c != b:
		let d  = b
		print(d)
		
your_function(2,3)
```

Este código de exemplo, exemplifica bem a ideia da variável imutável. Caso eu descomente a segunda linha da função `#let c = b`, ocorreria um erro no meu código pois uma váriavel que não deveria ser modificada está sendo acessada.
As varíaveis **let** e **var** também suportam especificadores de tipos, padrões e inicialização tardia.

```python
def your_function():
	let x: Int = 42
	let y: F64 = 17.0
	
	let z: F32
	if x != 0:
		z = 1.0
	else:
		z = foo()
	print(z)
	
def foo() -> F32:
	return 3.14
	
your_function()
```

Olha que coisa linda é  esse superset.

##### Tipo Struct:

Quando trabalharmos em sistemas modernos precisamos de uma forma segura de construir abstrações e de alto nível sobre o controle do Layout de dados de baixo nível, acesso ao campo livre de indireção e outros truques de nicho. Mojo oferece suporte a isso usando o tipo `struct` (novamente lembrando de C e Rust).
Os tipos [structs](https://en.wikipedia.org/wiki/Struct_(C_programming_language)) são muito parecidos com classes, no entanto as classes são estremamente dinamicas com [dispatch dinâmico](https://pt.wikipedia.org/wiki/Liga%C3%A7%C3%A3o_din%C3%A2mica_(programa%C3%A7%C3%A3o_orientada_a_objetos)), [monkey-patching](https://en.wikipedia.org/wiki/Monkey_patch).
Structs são estáticos, vinculados em tempo de compilação e embutidos em seu container, em mojo uma struct seria declarada assim:

```python
struct MyPair:
	var first: Int
	var Second: Int
	
	fn __init__(self&, first: Int, second: Int):
		self.first = first
		self.second = second
		
	fn __lt__(self, rhs: MyPair) -> Bool:
		return self.first < rhs.first or
			(self.first == rhs.first and self.second < rhs.second)
```

A maior diferença em comparação com a classe é que todas as propriedades devem ser explicitamente declaradas com **var** ou **let**.

##### Tipificação forte:

Embora tenhamos tipos dinâmicos no python, o Mojo permite que você use tipificação forte em seus programas.
Uma das formas de empregar a verificação de tipo forte é com o struct.

```python
def pairTest() -> Bool:
	let p = MyPair(1,2)
	# return p < 4
	return True
```

Se descomentarmos `return p < 4` veremos um erro ocorrido pela função __lt__ utilizar os valores que seriam convertidos para a verificação. 
