---
title: "Lista Ligada"
date: 2023-04-30T00:17:12-03:00
---

A lista ligada é uma das estruturas mais simples na matéria de estruturas de dados. 
E ouso dizer que também chega a ser uma das mais importantes.
Pois com ela podemos criar estruturas muito mais complexas.
Um exemplo simples que podemos dar a lista ligada em C++ é:

```cpp
Class Node{
    private:
        int Value;
        Node* next;
    public:
        Node(int new_value){
            Value = new_value;
            next = NULL;
        }
};
```

Onde para aqueles que possuem um olho atento. 
Podem ver que a lista pode se expandir infinitamente para o seguinte.
De forma linear, ou O(1) para cada elemento e O(N) para o tamanho máximo da lista.

As proximas estruturas de dados apresentadas aqui terão "ou não" o uso de Lista Ligada para serem criadas.
Seu uso é estritamente necessário em árvores e estas irão melhorar ao máximo sua capacidade de navegar pela lista.

Até porque as árvores são abstrações maximas de uma lista que é a melhor versão de um vector, 
que são em si (dados sequenciais).

Pense numa lista como um vetor de dados um atrás do outro, e uma árvore sendo um vetor ordenado por padrão.
Esse é o poder de uma estrutura de Dados, organizar os dados para uso em momento de execução.
