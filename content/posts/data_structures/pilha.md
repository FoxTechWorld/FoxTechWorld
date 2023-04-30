---
title: "Pilha"
date: 2023-04-30T14:58:21-03:00
---

Seguindo o artigo anterior sobre listas ligadas, hoje vou falar sobre pilhas.
Uma pilha é uma estrutura de dados onde controlamos o topo da pilha e temos duas importantes funções:

- Empilhar
- Desempilhar

Isso significa que podemos adicionar um novo item ao topo da pilha e remover um item do topo da pilha.
Apesar de ser uma das mais simples estruturas de dados que utilizamos adjunto a fila, a pilha também chega a ser uma das mais importantes estruturas de dados.

Veja, quando precisamos fazer processamento concorrente, normalmente utilizamos ela para puxarmos um elemento, fazermos um processamento e puxarmos outro elemento.

Existem duas formas de implementarmos a pilha, usando [lista ligada](https://foxtechworld.github.io/lista_ligada/) e usando vetores.

Vou mostrar hoje como se escreve um pilha usando lista ligada em C++:


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