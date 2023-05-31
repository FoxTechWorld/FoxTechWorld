---
title: "Fila"
date: 2023-05-01T22:32:12-03:00
description: "Estrutura de dados fila"

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

##### O que é uma fila?

A fila é outra das estruturas de dados mais simples e mais importantes que temos atualmente.
Podemos implementa-la de duas formas, usando vetores ou listas ligadas que eu já havia citado neste [post](https://foxtechworld.github.io/lista_ligada/).

##### Quais são as principais operações de uma fila?

A fila também tem duas operações principais:
- Empilhar
- Desempilhar

##### Qual a diferença de uma fila para a pilha.
E tem como maior diferença com a fila o metódo de inserção e remoção que é um ***Fifo*** (First In First Out).

Dentro de uma fila, a inserção deve ser feita sempre após o ultimo elemento inserido e sua remoção deve ser feita sempre daquele que foi inserido primeiro, novamente (FIFO).

Caso desejemos acessar um item do meio da fila, devemos remover todos os primeiros devem ser desenfileirados.

###### Exemplo de fila em c++

Aqui temos um exemplo em c++ de uma fila.

```cpp

#include <iostream>

using namespace std;

class Node{
    private:
        int data;
        Node* next;
    public:
        Node(int val){
            data = val;
            next = NULL;
        }
};

class Queue{
    private:
        Node* front;
        Node* rear;
    public:
        Queue(){
            front = NULL;
            rear = NULL;
        }

        void enqueue(int val){
            Node* newNode = new Node(val);
            if (front == NULL){
                front = rear = newNode;
            }else{
                rear->next = newNode;
                rear = newNode;
            }
        }

        void dequeue(){
            if (front == NULL){
                return;
            }else{
                Node* temp = front;
                front = front->next;
                if (front == NULL){
                    rear = NULL;
                }
                delete temp;
            }
        }
};

int main() {
    Queue queue;
    queue.enqueue(10);
    queue.enqueue(20);
    queue.enqueue(30);
    queue.dequeue();
    queue.dequeue();
    // Queue: 30
    return 0;
}
```
Repare que agora temos duas variaveis de controle, o front e o rear. Caso o front não tenha nada, não conseguimos desenfileirar nada.
E caso precisemos enfileirar algo, preciso adicionar ao rear.

Novamente, o exemplo anterior foi feito usando lista ligada, mas em caso de ambiente limitado como embarcados seria melhor utilizar essa estrutura usando vetores;

| Lista de Aplicações Que Usam Fila                  |
|----------------------------------------------------|
| Escalonamento de processos na CPU                  |
| Escalonamento de acesso a memória secundária       |
| Sincronização de processos assincronos             |
| Gerenciamento da fila de impressão                 |
| Controle da interrupção de hardware                |
| Controle de chamadas em call centers               |
| Busca em largura em grafos                         |

Saiba que ao usar uma fila, você pode aumentar o peso, e quantidade de processamento que sua aplicação ocasiona, em troca de uma estrutura de controle.

```
(Aplicação) -----> (Banco de Dados)

(Aplicação) ---> Fila ---> (Banco de Dados)
```

Não sei dizer se vocês conseguem intuitivamente reconhecer mas ao usar uma fila, você primeiro escreve na Fila e a fila escreve no banco.

Ao inves de tentarmos conectar centenas de milhares de operações diretamente no banco, você conecta um pool bem menor de escrita em paralelo.

Isso é uma otimização simples e barato que melhorar e muito a performance e a confiabilidade.
