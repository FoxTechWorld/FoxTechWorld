---
title: "Heap"
date: 2023-05-03T16:51:33-03:00
description: "Estrutura de Dados Heap"
author: "KitsuneSemCalda"
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

### O que é uma Heap?

A heap será a ultima estrutura de dados que será apresentada por enquanto neste blog. 

Podemos com ela encerrar a primeira temporada de estrutura de dados.

E com isso irei iniciar novos assuntos.

A heap é uma estrutura de dados que pode ser implementada com arranjos e como [lista ligada](https://foxtechworld.github.io/lista_ligada/), mas podemos reconhece-la
como fila de prioridades. 

E apesar de ser uma lista linear tratamos a heap como uma [árvore de busca binária](https://pt.wikipedia.org/wiki/%C3%81rvore_bin%C3%A1ria_de_busca)

Não vou aprofundar em árvores neste momento, mas deixo o link livre a quem estiver interessado.

### Casos de uso de heaps

Assim sendo, a heap tem as funções de inserir, remover, corrige Subindo, corrige descendo essas sendo suas principais funções. E normalmente as heaps são utilizadas em:

| Aplicações que usam Heap             |
|--------------------------------------|
| Ordenação                            |
| Algoritmos de buscas                 |
| Fila de Prioridade                   |
| Seleção dos k maiores                |
| Algoritmos de compressão             |
| Algoritmos de agendamento            |
| Algoritmos de Arvoré geradora minima |
| Algoritmos de caminho mínimo         |
| Sistemas de Cache                    |


### Exemplo de heap em c++
E aqui definimos nossa estrutura de heap em c++ usando lista ligada.

```cpp
class HeapNode {
private:
    int val;
    HeapNode* next;
public:
    HeapNode(int val) {
        this->val = val;
        this->next = nullptr;
    }
};

class MaxHeap {
private:
    HeapNode* root;

    MaxHeap() {
        root = nullptr;
    }
public:
    void insert(int val) {
        HeapNode* new_node = new HeapNode(val);

        if (root == nullptr) {
            root = new_node;
        } else if (val > root->val) {
            new_node->next = root;
            root = new_node;
        } else {
            HeapNode* curr = root;

            while (curr->next != nullptr && val <= curr->next->val) {
                curr = curr->next;
            }

            new_node->next = curr->next;
            curr->next = new_node;
        }
    }

    int extractMax() {
        if (root == nullptr) {
            cout << "Heap vazio!" << endl;
            return -1;
        }

        int max_val = root->val;
        HeapNode* old_root = root;
        root = root->next;
	        delete old_root;

        return max_val;
    }

protected:
    void heapifyUp(HeapNode* node) {
        HeapNode* parent = getParent(node);

        if (parent != nullptr && node->val > parent->val) {
            swap(node->val, parent->val);
            heapifyUp(parent);
        }
    }

    void heapifyDown(HeapNode* node) {
        HeapNode* child = getMaxChild(node);

        if (child != nullptr && child->val > node->val) {
            swap(node->val, child->val);
            heapifyDown(child);
        }
    }

    HeapNode* getParent(HeapNode* node) {
        if (node == root) {
            return nullptr;
        }

        HeapNode* curr = root;

        while (curr->next != node) {
            curr = curr->next;
        }

        return curr;
    }

    HeapNode* getMaxChild(HeapNode* node) {
        if (node->next == nullptr) {
            return nullptr;
        }

        HeapNode* max_child = node->next;
        HeapNode* curr = node->next;

        while (curr != nullptr) {
            if (curr->val > max_child->val) {
                max_child = curr;
            }

            curr = curr->next;
        }

        return max_child;
    }
};
```

Repare que as funções de corrige subindo e corrige descendo são chamadas de heapifyUp e heapifyDown, eles estão protegidos por protected pois são de extrema importancia para o funcionamento da MaxHeap.

E realmente não precisamos de ter seu funcionamento exposto, pois sua chamada poderia ser implementada diretamente após a inserção (veja que eu não botei isso no exemplo).

Além disso, veja que usamos root, mas não dividimos em esquerda e direita, o corrige subindo e descendo que balancea o heap como se fosse um balanceador de arvore binária
