---
title: "Pilha"
date: 2023-04-30T14:58:21-03:00
description: "Estrutura de dados pilha"

categories:
    - Tecnology
    - Data Structure
tags:
    - Studying
    - Programming
comments: true
authorbox: true
mathjax: true
---

##### O que são pilhas?

Seguindo o artigo anterior sobre listas ligadas, hoje vou falar sobre pilhas.

Uma pilha é uma estrutura de dados onde controlamos o topo da pilha e temos duas importantes funções.

![Estrutura de Dados: Pilha](data:image/png;base64,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)

###### Principais operações de uma fila

- Empilhar
- Desempilhar

Isso significa que podemos adicionar um novo item ao topo da pilha e remover um item do topo da pilha.

Apesar de ser uma das mais simples estruturas de dados que utilizamos adjunto a fila, a pilha também chega a ser uma das mais importantes estruturas de dados.

Veja, quando precisamos fazer processamento concorrente, normalmente utilizamos ela para puxarmos um elemento, fazermos um processamento e puxarmos outro elemento.

Existem duas formas de implementarmos a pilha, usando [lista ligada](https://foxtechworld.github.io/lista_ligada/) e usando vetores.

Vou mostrar hoje como se escreve um pilha usando lista ligada em C++:

Repare que as funções básicas de uma pilha está apenas em empilhar e desempilhar mas podemos adicionar funções extras que verificam e a pilha, que realizem algum processo ao desempilhar e etc.

###### Exemplo de pilha em c++

```cpp

#include <iostream>

using namespace std;

class Node{
    private:
        int data;
        Node* next;
    public:
        Node(int data){
            this->data = data;
            this->next = NULL;
        }
};

class Stack{
    private:
        Node* top;
    public:
        Stack(){
            this->top = NULL;
        }

        void push(int data){
            Node* newNode = new Node(data);
            newNode->next = this->top;
            this->top = newNode;
        }

        int pop(){
            if (this->top == NULL){
                cout << "A pilha está vazia" << endl;
                return 0;
            }

            int data = this->top->data;
            Node* temp = this->top;
            this->top = this->top->next;
            delete temp;
            return data;
        }
};
```

Parece complexo mas não é, primeiramente veja que usamos ponteiros para controlar a estrutura e usamos o Node que é a classe que definimos no Lista Ligada. 

A ideia é expandir infinitamente a pilha o que em ambiente de um pc mais potente como um desktop ou servidor.

Em caso de de necessitarmos de usarmos essa estrutura em um ambiente mais limitado como embarcados, devemos usar uma implementação com vetores ao invês de lista ligada.

Mas nesse caso devemos lidar com o problema de inserir em uma pilha cheia.

###### Casos de uso de uma pilha:

| Lista de Aplicações Que Usam Pilha                 |
|----------------------------------------------------|
| Calculadora para expressões matemáticas            |
| Conversão de número decimal para binário           |
| Retirada de mercadorias de um caminhão de entregas |
| Recurso de desfazer e refazer em aplicações        |

Caso eu não esteja esquecido, a pilha também é usada na construção de AST e na árvore polonesa reversa (para fazer calculos matemáticos de forma precisa).
