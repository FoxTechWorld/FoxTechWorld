---
title: "Union Finds"
date: 2023-06-17T14:31:56-03:00
description: "Melhorando a velocidade de pesquisa em grafos com union finds"
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

Se você leu sobre [BFS](https://foxtechworld.github.io/2023/05/busca-em-largura/) e [DFS](https://foxtechworld.github.io/2023/05/busca-em-profundidade/) deve ter percebido que a maioria das pesquisas são relativamente mais rápidas que a força bruta (busca linear). Mas e quando os grafos se tornam gigantescos?

Bom, neste caso você utiliza outros algoritmos para reduzir o tamanho dos grafos a subgrafos menores e conseguir realizar o BFS / DFS. Mas mesmo assim você pode precisar de algum auxilio e daí surge a ideia de um Union Find, uma estrutura de dados que ajuda a aumentar a velocidade de busca em grafos. E essa estrutura é chamada Union Find, mas também pode ser chamada de [Disjoint-Set](https://pt.wikipedia.org/wiki/Uni%C3%A3o-busca).

A implementação básica do Union-Find utiliza uma matriz ou vetor para representar os conjuntos e cada elemento possui uma referencia a seu "pai" ou a si próprio caso não haja pai. Veja que cada elemento é considerado uma árvore isolada.

![Estrutura de Dados: Union-Find](https://cgi.luddy.indiana.edu/~yye/c343-2019/images/Figure6.5.png)

As duas principais operações de um disjoint-set são `Find` e `Union` que aprimoram a velocidade de pesquisa pela `compressão do caminho` onde atualiza - se todos os ponteiros do "pai" dos elementos visitados durante o Find, de forma que eles apontem diretamente para a raiz do conjunto. Essa compressão do caminho tem um impacto significativo na velocidade de busca pois reduz a altura da árvore que representa o conjunto. Quando o elemento é pesquisado, a árvore é percorrida até encontrar a raiz que é o representante do conjunto. Durante o percurso, os ponteiros do pai são atualizados para apontar diretamente para a raiz, encurtando o caminho percorrido.

Aqui está um exemplo de implementação do Union Finds em c++:

```c++
#include <vector>

class UnionFind {
private:
    std::vector<int> parent; // vetor que armazena o pai de cada elemento
    std::vector<int> rank;   // vetor que armazena a altura da árvore para cada elemento

public:
    UnionFind(int size) {
        parent.resize(size);
        rank.resize(size, 0);

        // Inicializa cada elemento como sua própria raiz
        for (int i = 0; i < size; i++) {
            parent[i] = i;
        }
    }

    // Encontra o representante (raiz) do conjunto ao qual o elemento pertence
    int find(int x) {
        if (parent[x] != x) {
            parent[x] = find(parent[x]); // Aplica a compressão de caminho
        }
        return parent[x];
    }

    // Une dois conjuntos em um único conjunto maior
    void unite(int x, int y) {
        int rootX = find(x);
        int rootY = find(y);

        if (rootX != rootY) {
            // Une os conjuntos com base na altura (rank)
            if (rank[rootX] < rank[rootY]) {
                parent[rootX] = rootY;
            } else if (rank[rootX] > rank[rootY]) {
                parent[rootY] = rootX;
            } else {
                parent[rootY] = rootX;
                rank[rootX]++;
            }
        }
    }
};
```

Para representar a diferença que um Union Finds faz, eu vou utilizar os exemplos de dfs e bfs com e sem Union Finds

### Exemplo de DFS sem Union Finds

```py
def dfs(graph, visited, vertex):
    visited.add(vertex)
    print("Visitando vértice:", vertex)

    if vertex in graph:
        for neighbor in graph[vertex]:
            if neighbor not in visited:
                dfs(graph, visited, neighbor)

graph = {
    1: [2, 3, 4],
    2: [5, 6, 7, 8],
    3: [7, 8, 9, 10],
    4: [9, 10, 11, 12],
    5: [11, 12, 13, 14],
    6: [13, 14, 15, 16],
    7: [15, 16, 17, 18],
    8: [17, 18, 19, 20],
    9: [19, 20, 21, 22],
    10: [21, 22, 23, 24],
    11: [23, 24, 25, 26],
    12: [25, 26, 27, 28],
    13: [27, 28, 29, 30],
    14: [29, 30, 31, 32],
    15: [31, 32, 33, 34],
    16: [33, 34, 35, 36],
    17: [35, 36, 37, 38],
    18: [37, 38, 39, 40],
    19: [39, 40, 41, 42],
    20: [41, 42, 43, 44],
    21: [43, 44, 45, 46],
    22: [45, 46, 47, 48],
    23: [47, 48, 49, 50],
    24: [49, 50, 51, 52],
    25: [51, 52, 53, 54],
    26: [53, 54, 55, 56],
    27: [55, 56, 57, 58],
    28: [57, 58, 59, 60],
    29: [59, 60, 61, 62],
    30: [61, 62, 63, 64]
}

visited = set()

print("Busca em Profundidade (DFS):")
for vertex in graph:
    if vertex not in visited:
        dfs(graph, visited, vertex)
```

### Exemplo de BFS sem Union Finds
```py
from collections import deque

# Definição do grafo

grafo = {
    1: [2, 3, 4],
    2: [5, 6, 7, 8],
    3: [7, 8, 9, 10],
    4: [9, 10, 11, 12],
    5: [11, 12, 13, 14],
    6: [13, 14, 15, 16],
    7: [15, 16, 17, 18],
    8: [17, 18, 19, 20],
    9: [19, 20, 21, 22],
    10: [21, 22, 23, 24],
    11: [23, 24, 25, 26],
    12: [25, 26, 27, 28],
    13: [27, 28, 29, 30],
    14: [29, 30, 31, 32],
    15: [31, 32, 33, 34],
    16: [33, 34, 35, 36],
    17: [35, 36, 37, 38],
    18: [37, 38, 39, 40],
    19: [39, 40, 41, 42],
    20: [41, 42, 43, 44],
    21: [43, 44, 45, 46],
    22: [45, 46, 47, 48],
    23: [47, 48, 49, 50],
    24: [49, 50, 51, 52],
    25: [51, 52, 53, 54],
    26: [53, 54, 55, 56],
    27: [55, 56, 57, 58],
    28: [57, 58, 59, 60],
    29: [59, 60, 61, 62],
    30: [61, 62, 63, 64]
}

def bfs(grafo, inicio):
    visitados = set()
    fila = deque()
    
    visitados.add(inicio)
    fila.append(inicio)
    
    while fila:
        vertice = fila.popleft()
        print(vertice)  # Realize qualquer ação desejada com o vértice visitado
        
        for vizinho in grafo.get(vertice, []):
            if vizinho not in visitados:
                visitados.add(vizinho)
                fila.append(vizinho)

# Chamada da função BFS com vértice de origem 1
bfs(grafo, 1)

```
### Exemplo de DFS com Union Finds

```py
class UnionFind:
    def __init__(self, size):
        self.parent = list(range(size))
        self.rank = [0] * size

    def find(self, x):
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])  # Aplica a compressão de caminho
        return self.parent[x]

    def unite(self, x, y):
        root_x = self.find(x)
        root_y = self.find(y)

        if root_x != root_y:
            # Une os conjuntos com base na altura (rank)
            if self.rank[root_x] < self.rank[root_y]:
                self.parent[root_x] = root_y
            elif self.rank[root_x] > self.rank[root_y]:
                self.parent[root_y] = root_x
            else:
                self.parent[root_y] = root_x
                self.rank[root_x] += 1


def dfs(graph, visited, union_find, vertex):
    visited.add(vertex)
    print("Visitando vértice:", vertex)

    if vertex in graph:
        for neighbor in graph[vertex]:
            if neighbor not in visited:
                union_find.unite(vertex, neighbor)
                dfs(graph, visited, union_find, neighbor)

graph = {
    1: [2, 3, 4],
    2: [5, 6, 7, 8],
    3: [7, 8, 9, 10],
    4: [9, 10, 11, 12],
    5: [11, 12, 13, 14],
    6: [13, 14, 15, 16],
    7: [15, 16, 17, 18],
    8: [17, 18, 19, 20],
    9: [19, 20, 21, 22],
    10: [21, 22, 23, 24],
    11: [23, 24, 25, 26],
    12: [25, 26, 27, 28],
    13: [27, 28, 29, 30],
    14: [29, 30, 31, 32],
    15: [31, 32, 33, 34],
    16: [33, 34, 35, 36],
    17: [35, 36, 37, 38],
    18: [37, 38, 39, 40],
    19: [39, 40, 41, 42],
    20: [41, 42, 43, 44],
    21: [43, 44, 45, 46],
    22: [45, 46, 47, 48],
    23: [47, 48, 49, 50],
    24: [49, 50, 51, 52],
    25: [51, 52, 53, 54],
    26: [53, 54, 55, 56],
    27: [55, 56, 57, 58],
    28: [57, 58, 59, 60],
    29: [59, 60, 61, 62],
    30: [61, 62, 63, 64]
}


size = max(max(graph.keys()), max(neighbor for neighbors in graph.values() for neighbor in neighbors)) + 1

visited = set()
union_find = UnionFind(size)

print("Busca em Profundidade (DFS):")
for vertex in graph:
    if vertex not in visited:
        dfs(graph, visited, union_find, vertex)
```

### Exemplo de BFS com Union Finds

```py
class UnionFind:
    def __init__(self, size):
        self.parent = list(range(size))
        self.rank = [0] * size

    def find(self, x):
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])  # Aplica a compressão de caminho
        return self.parent[x]

    def unite(self, x, y):
        root_x = self.find(x)
        root_y = self.find(y)

        if root_x != root_y:
            # Une os conjuntos com base na altura (rank)
            if self.rank[root_x] < self.rank[root_y]:
                self.parent[root_x] = root_y
            elif self.rank[root_x] > self.rank[root_y]:
                self.parent[root_y] = root_x
            else:
                self.parent[root_y] = root_x
                self.rank[root_x] += 1


def bfs(grafo, inicio):
    visitados = set()
    fila = deque()
    union_find = UnionFind(max(grafo.keys()) + 1)  # Cria a estrutura Union-Find

    visitados.add(inicio)
    fila.append(inicio)

    while fila:
        vertice = fila.popleft()
        print(vertice)  # Realize qualquer ação desejada com o vértice visitado

        for vizinho in grafo.get(vertice, []):
            if vizinho not in visitados:
                visitados.add(vizinho)
                union_find.unite(vertice, vizinho)  # Une os vértices visitados na estrutura Union-Find
                fila.append(vizinho)

    return union_find

grafo = {
    1: [2, 3, 4],
    2: [5, 6, 7, 8],
    3: [7, 8, 9, 10],
    4: [9, 10, 11, 12],
    5: [11, 12, 13, 14],
    6: [13, 14, 15, 16],
    7: [15, 16, 17, 18],
    8: [17, 18, 19, 20],
    9: [19, 20, 21, 22],
    10: [21, 22, 23, 24],
    11: [23, 24, 25, 26],
    12: [25, 26, 27, 28],
    13: [27, 28, 29, 30],
    14: [29, 30, 31, 32],
    15: [31, 32, 33, 34],
    16: [33, 34, 35, 36],
    17: [35, 36, 37, 38],
    18: [37, 38, 39, 40],
    19: [39, 40, 41, 42],
    20: [41, 42, 43, 44],
    21: [43, 44, 45, 46],
    22: [45, 46, 47, 48],
    23: [47, 48, 49, 50],
    24: [49, 50, 51, 52],
    25: [51, 52, 53, 54],
    26: [53, 54, 55, 56],
    27: [55, 56, 57, 58],
    28: [57, 58, 59, 60],
    29: [59, 60, 61, 62],
    30: [61, 62, 63, 64]
}

print("Busca em Largura (BFS):")
union_find = bfs(grafo, 1)

# Exemplo de uso da estrutura Union-Find após a BFS
print("Representantes dos conjuntos:")
for i in range(1, len(union_find.parent)):
    print(i, "->", union_find.find(i))
```

| Comando    | Time    | Consumo    |
|---------------- | --------------- | --------------- |
|python3 bfs_search.py |  0,07s user 0,05s system | 130% cpu 0,096 total|
|python3 dfs_search.py |  0,06s user 0,04s system | 130% cpu 0,076 total|
|python3 dfs_union_search.py |  0,09s user 0,04s system | 139% cpu 0,091 total|
|python3 bfs_union_search.py | 0,08s user 0,05s system |  133% cpu 0,095 total|

### Casos de uso do Union Finds

Perceba que com union finds a performance cai um pouco mas tem determinadas situações a velocidade do union finds pode superar a da busca direta:

1. Grafos Densos.
2. Operações frequentes de união e busca.
3. Componentes conectados.
4. Otimização de caminhos.

Aqui está algumas situações onde está data structure foi implementada:

- Detecção de ciclos em grafos
- Algoritmo de Kruskal
- Segmentação de imagens.
- Sistema de gerenciamento de arquivos.
- Detecção de componentes conectados em redes sociais.
