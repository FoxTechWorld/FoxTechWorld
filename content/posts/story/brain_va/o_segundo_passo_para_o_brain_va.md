---
title: "O segundo passo para o brain va"
date: 2023-05-05T10:25:56-03:00
description: "definindo o design pattern do brain VA"

categories:
  - "Programming"
  - "Projetos"
tags:
  - "Brain VA"
  - "Tecnology"
  - "Programming"

comments: true
authorbox: true
---

Com o primeiro passo completo estamos indo para o segundo passo, definir as estruturas da [Factory](https://pt.wikipedia.org/wiki/F%C3%A1brica_(programa%C3%A7%C3%A3o_orientada_a_objetos))
Isso nos garante que nenhuma classe invada a abstração de outra classe e podemos definir corretamente os escopos de cada classe. 
A implementação em si de cada classe não é importante no momento, mas sua capacidade de facilitar a vida para quem usa é inegável se atender suas condições de uso. 
Como tudo que se é utilizado no dia a dia.

A ideia principal é usar 3 classes que vão ser usadas na classe principal de factory

- WikipediaSearch
```python
class WikipediaSearch:
    def __init__(self, term) -> None:
        pass

    def search(self):
        pass
pass
```
- Gpt3
```python
class Gpt3:
    def __init__(self, prompt) -> None:
        pass

    def generate(self):
        pass
pass
```
- Prolog File
```python
class PrologFile:
    def __init__(self, term, content):
        pass

    def create(self):
        pass
pass
```

Todas essas classes sendo usadas pela classe

- ChatBot Factory
```python
class ChatBotFactory:
    def create_chatbot(self, term):
        pass
pass
```

[Finalizando projeto](https://foxtechworld.github.io/2023/05/implementando-e-finalizando-o-brain-va/)

