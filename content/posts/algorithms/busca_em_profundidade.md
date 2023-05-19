---
title: "Busca em profundidade"
date: 2023-05-19T09:09:15-03:00
description: "Busca em largura é a única forma? Claro que não"

categories:
  - "Tecnology"
  - "Algorithm"
tags:
  - "Programming"
  - "Studying"

comments: true
authorbox: true
---

###### Algoritmo de Busca em Profundidade

O algoritmo de busca em profundidade, conhecido como DFS (do inglês Depth-First Search), é um método utilizado para percorrer ou explorar grafos de maneira sistemática e eficiente. 

Ao contrário do algoritmo de busca em largura (BFS), o DFS segue uma abordagem de "expansão em profundidade", explorando um caminho o mais longe possível antes de retroceder.

###### Visitação dos vértices

Ao realizar uma busca em profundidade, o algoritmo DFS visita os vértices do grafo de forma recursiva. 

Ele começa em um vértice inicial e visita um de seus vizinhos não visitados. 

Em seguida, repete o mesmo processo a partir desse vizinho até que não haja mais vizinhos não visitados. 

Quando isso acontece, o algoritmo retrocede para o vértice anterior e continua a exploração a partir de outro vizinho não visitado, caso exista.

Essa abordagem leva a uma exploração mais profunda do grafo antes de voltar aos vértices anteriores. 

Em essência, o DFS explora um ramo específico até atingir um vértice de folha antes de retroceder.

###### Estrutura de dados utilizada

Para implementar o algoritmo DFS, é comum utilizar uma [pilha (stack)](https://foxtechworld.github.io/2023/04/pilha/) para rastrear os vértices a serem visitados. 

A pilha segue o princípio LIFO (Last In, First Out), o que significa que o último vértice adicionado à pilha é o primeiro a ser visitado.

Alternativamente, é possível utilizar uma abordagem recursiva para implementar o DFS, onde a recursão assume o papel de uma pilha. 

A cada chamada recursiva, um novo vértice é visitado, e a função recursiva é chamada novamente para explorar os vizinhos desse vértice.

###### Exemplo de implementação em c++:

```cpp
void dfs(vector<vector<int>>& graph, vector<bool>& visited, int vertex) {
    visited[vertex] = true;
    cout << "Visitando vértice: " << vertex << endl;

    for (int neighbor : graph[vertex]) {
        if (!visited[neighbor]) {
            dfs(graph, visited, neighbor);
        }
    }
}
```

vamos fazer um microbenchmark agora comparando a velocidade de se usar força bruta, busca em largura e busca em profundidade

| Comando    | Time    | Consumo    |
|---------------- | --------------- | --------------- |
| python3 brute_force.py    | 0,09s user 0,06s system    | 126% cpu 0,120 total |
| python3 bfs_search.py    | 0,06s user 0,04s system | 120% cpu 0,085 total |
| python3 dfs_search.py   | 0,06s user 0,04s system   | 130% cpu 0,077 total   |

Para cada teste eu usei o seguinte código

###### brute_force.py
```py
def brute_force(graph):
    vertices = list(graph.keys())
    
    for i in range(len(vertices)):
        for j in range(i+1, len(vertices)):
            vertex1 = vertices[i]
            vertex2 = vertices[j]
            
            if vertex2 in graph[vertex1]:
                print(f"Existe uma aresta entre os vértices: {vertex1} - {vertex2}")
            else:
                print(f"Não existe uma aresta entre os vértices: {vertex1} - {vertex2}")

# Exemplo de grafo com 14 vértices
graph = {
    1: [2, 3, 4],
    2: [5, 6],
    3: [7, 8],
    4: [9, 10],
    5: [11, 12],
    6: [13, 14]
}

brute_force(graph)
```
###### bfs_search.py
```py
from collections import deque

# Definição do grafo
grafo = {
    1: [2, 3, 4],
    2: [5, 6],
    3: [7, 8],
    4: [9, 10],
    5: [11, 12],
    6: [13, 14]
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
###### dfs_search.py
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
    2: [5, 6],
    3: [7, 8],
    4: [9, 10],
    5: [11, 12],
    6: [13, 14]
}

visited = set()

print("Busca em Profundidade (DFS):")
for vertex in graph:
    if vertex not in visited:
        dfs(graph, visited, vertex)
```

A computação em base matemática, usando algoritmos, é mais elegante e eficiente do que a computação ingênua por diversos motivos.

Em primeiro lugar, os algoritmos são desenvolvidos com base em princípios matemáticos e estruturas lógicas, o que permite uma abordagem sistemática e organizada na resolução de problemas. Eles são projetados para aproveitar propriedades matemáticas, como simetria, recursividade, otimização e complexidade, de forma a garantir soluções eficientes e elegantes.

Além disso, a utilização de algoritmos permite a criação de soluções escaláveis, que podem lidar com problemas de tamanhos variados de maneira eficiente. Os algoritmos são projetados para minimizar o tempo de execução e o consumo de recursos, tornando possível resolver problemas complexos em um tempo razoável.
