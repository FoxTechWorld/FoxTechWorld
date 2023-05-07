---
title: "O primeiro passo para o brain VA"
date: 2023-05-05T08:54:31-03:00
description: "Iniciando o brain VA"
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

Neste momento, estou interessado em usar o design pattern de factory. E como primeiro passo eu decidi montar a linha de comando (sem argparse) para o projeto.
Como eu estou criando o projeto do zero, eu prefiro criar uma função get_arg para capturar os argumentos.

Depois disso basta eu definir uma Factory que inicie tudo automaticamente, alguns testes com injeção de dependencia e pronto teremos um projeto feito para rodar perfeitamente.

PS: Apesar de usar uma linguagem lógica por trás, isto não é uma inteligencia artificial e sim um chatbot que saiba definir corretamente regras e fatos. Para qualquer dúvida temos na wikipedia explicações sobre o [prolog](https://pt.wikipedia.org/wiki/Prolog)

```python
import sys

def get_arg():
    argument = ""
    try:
        if (len(sys.argv) == 1):
            argument = sys.argv[1]
        if (len(sys.argv) > 1):
            for i in sys.argv:
                if (i != sys.argv[0]):
                    argument += (i + " ")
    except IndexError:
        print("Necessitamos de pelo menos um argumento para conseguir rodar")
    finally:
        return argument
pass
```

A função get_arg foi construída de forma que o argument comece com uma string vazia, assim iniciamos um try/except que verifique caso não haja nada em sys.argv que é a lista de argumentos recebidos pelo script

Assim produzimos duas principais regras de negócio:

- Caso haja apenas 1 argumento após a chamada do script podemos ter uma substituição simples da string vazia pelo argumento.

- Caso haja mais de 1 argumento após a chamada do script começamos a rodar um for sobre os elementos de sys.argv que é uma lista (lista de argumentos) e ignorando o main.py que é nosso sys.argv[0], começamos a concatenar os valores da lista com um espaço ao argument

Com essa simples função já cobrimos o caso inicial de ter um termo para pesquisar na wikipedia e a única lib que usamos é a lib "sys". Mas, e para rodar essa função?

Neste caso precisamos ter um pouquinho de tratamento a mais para elegância:

```python
if __name__ == "__main__":
    argument = get_arg()
    if argument != "":
        print(f"O argumento a ser pesquisado é: {argument}")
    pass
pass
```

A partir disso podemos começar a trabalhar no robô da wikipedia, prompt e gpt.

O proximo passo é definir claramente o inicio de nossa estrutura factory que vai começar a produzir os arquivos de prolog que serão uma base lógica para esse projeto.

- [Segundo Passo](https://foxtechworld.github.io/2023/05/o-segundo-passo-para-o-brain-va/)
