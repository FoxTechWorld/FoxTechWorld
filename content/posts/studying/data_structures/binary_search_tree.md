---
title: "Binary Search Tree"
date: 2023-06-19T15:57:38-03:00
description: "Vamos avançar com a mais básica estrutura de árvore, a Árvore de Busca Binaria ou Binary Search Tree"
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
[sitemap]
  changefreq = 'weekly'
  priority = 0.5
---

Para retomar-mos a ideia de estrutura de dados fora da série de grafos, eu decidi dar uma pulada rápida em árvores e depois eu volto em estruturas baseadas em listas. Para quem quiser seguir a ideia linearmente temos este conjunto de [recomendações](https://foxtechworld.github.io/2023/05/canais-youtube-sobre-tecnologia-que-eu-recomendo/).

Para trabalharmos com a árvore de busca binaria precisamos atualizar o conceito de Nó ou Node que estavamos usando.

### Modelo de Node Antigo:

```cpp
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
```

### Modelo de Node Novo:

```cpp
class Node{
    private:
        int data;
        Node* left;
        Node* right;
    public:
        Node(int new_data){
            this->data = new_data;
            this->left = NULL;
            this->right = NULL;
        }
};
```

Perceberam a mudança? agora ao invês de apontarmos para o Node seguinte, apontamos para sua representação a esquerda e a direita, voltando novamente um árvore segue seus galhos a esquerda e a direita.

Para ser intuitivo, uma nova inserção caso seja menor que o root vai para a esquerda, caso seja maior que o root vai para direita.

Se temos um novo Nó podemos definir a estrutura de árvore assim:

```cpp
class Node{
    friend class BST;
    private:
        int data;
        Node* left;
        Node* right;
    public:
        Node(int new_data){
            this->data = new_data;
            this->left = NULL;
            this->right = NULL;
        }
};

class BST{
    private:
        Node* root;
    public:
        BST(){
            this->root = NULL;
        }
};
```

Em uma visão simples, assim é construída uma árvore de busca binária. Mas nós temos algumas operações para inserir, remover ... etc.

A operação de inserção pode ser implementada assim.

```cpp
void inserir(int new_data){
    if (root == NULL){
        root = new Node(new_data);
        return;
    }

    Node* temp = root;

    while (temp != NULL){
        if (data < temp->data){
            if (temp->left = NULL){
                temp->left = new Node(new_data);
                return;
            }
            temp = temp->left;
        }

        if (data > temp->data){
            if (temp->left = NULL){
                temp->left = new Node(new_data);
                return;
            }
            temp = temp->right;
        }
    }
}
```

Além disso temos três formas de navegar pela ABB, (inorder traversal), (preorder traversal), (postorder traversal).

Quando navegamos na inorder traversal que é implementada assim:

```cpp
void inorderTraversal(Node* node){
    if (node != NULL){
        inorderTraversal(node->left);
        cout << node->data << " ";
        inorderTraversal(node->right);
    }
}
```

Estamos caminhando "em ordem" primeiro o nó da esquerda, depois o nó da direita retornando assim os elementos de forma crescente.

Quando navegamos de forma preorder traversal que é implementada assim:

```cpp
void preorderTraversal(Node* node){
    if (node != NULL){
        cout << node->data << " ";
        preorderTraversal(node->left);
        preorderTraversal(node->right);
    }
}
```
Estamos navegando o próprio nó em seguida o da esquerda e por fim o da direita. E quando estamos navegando de forma postorder traversal que é implementada assim:

```cpp
void postorderTraversal(Node* node){
    if (node != NULL){
        postorderTraversal(node->left);
        postorderTraversal(node->right);
        cout << node->data << " ";
    }
}
```

Nesta forma de navegação a gente visita primeiro o nó da esquerda, depois o nó da direita e por fim o proprio nó.

Como um exemplo de navegação, imagine a seguinte árvore:

```
        4
       / \
      2   6
     / \   \
    1   3   7
```

A navegação de cada forma é:

Inorder traversal: 1 2 3 4 6 7
Preorder traversal: 4 2 1 3 6 7
Postorder traversal: 1 3 2 7 6 4

E para remover utilizamos  a seguinte implementação:

```cpp
Node* minValueNode(Node* node) {
    Node* current = node;
    while (current && current->left != nullptr) {
        current = current->left;
    }
    return current;
}

Node* removeNode(Node* root, int key) {
    if (root == nullptr) {
        return root;
    }

    if (key < root->data) {
        root->left = removeNode(root->left, key);
    } else if (key > root->data) {
        root->right = removeNode(root->right, key);
    } else {
        if (root->left == nullptr) {
            Node* temp = root->right;
            delete root;
            return temp;
        } else if (root->right == nullptr) {
            Node* temp = root->left;
            delete root;
            return temp;
        }

        Node* temp = minValueNode(root->right);
        root->data = temp->data;
        root->right = removeNode(root->right, temp->data);
    }
    return root;
}
```

Neste caso a implementação da remoção deve ser feita de forma cuidadosa, pois precisamos garantir que a árvore mantenha sua propriedade de árvore. Mas saiba que isso é muito dificil na prática por causa de desbalanceamento.

Para resolver o problema do desbalanceamento temos outras formas de árvore, como AVL, Rubro-Negra, Árvore B ... etc.
