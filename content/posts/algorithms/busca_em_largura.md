---
title: "Busca em largura"
date: 2023-05-18T14:05:40-03:00
description: "Como fazer uma pesquisa de busca em um grafo? Usando busca em largura"

categories:
  - "Tecnology"
  - "Algorithm"
tags:
  - "Programming"
  - "Studying"

comments: true
authorbox: true
mathjax: true
---

##### Para começar vamos contextualizar o que é um grafo.

Um grafo é uma estrutura matemática usada para representar relacionamentos entre objetos.

Ele consiste em um conjunto de pontos, chamados de vértices (ou nós), que são conectados por linhas, chamadas de arestas. 

Grafos são amplamente utilizados em diferentes áreas, como ciência da computação, matemática, redes sociais, teoria dos jogos, entre outros, para modelar e analisar diversas situações.

##### Onde grafos são utilizados em computadores? Vou especificar pontos e estruturas em que grafos comumente são utilizados:

- **Redes Sociais**

Grafos são usados para modelar conexões entre usuários em plataformas de redes sociais, permitindo recomendações de amizade, análise de comunidades e detecção de influenciadores.

- **Roteamento de Rede**

Grafos são usados para modelar redes de computadores e auxiliar no roteamento eficiente de pacotes de dados, como no protocolo de roteamento OSPF.

- **Sistema de Recomendação**

Grafos são utilizados para representar a estrutura da web e auxiliar os motores de busca a indexar e percorrer páginas da web de maneira eficiente.

- **Bancos de Dados**

Grafos são usados em bancos de dados orientados a grafos para modelar relacionamentos complexos entre dados, permitindo consultas eficientes e análises de redes de dados interconectados.

- **Jogos Eletrônicos**

Grafos são usados para modelar ambientes e relações entre objetos em jogos, como caminhos, movimentos de personagens e interações com elementos do jogo.

- **Reconhecimento de padrões**

Grafos são usados em algoritmos de reconhecimento de padrões para modelar relações entre objetos e identificar características comuns.

- **Otimização e planejamento**

Grafos são usados para resolver problemas de otimização e planejamento, como agendamento de tarefas, roteamento de veículos, alocação de recursos e planejamento de projetos.

##### Com isso dito vamos falar sobre o algoritmo do BFS

BFS (Busca em Largura, em inglês Breadth-First Search) é um algoritmo de busca utilizado para percorrer ou explorar grafos de forma sistemática e eficiente. 

A ideia principal por trás do BFS é explorar todos os vértices vizinhos de um vértice inicial antes de prosseguir para os vértices adjacentes a esses vizinhos. 

Ele segue uma abordagem conhecida como "expansão em largura", em que explora gradualmente o grafo em camadas, começando pelo vértice de origem e expandindo-se para os vértices mais próximos antes de prosseguir para vértices mais distantes.

O algoritmo BFS utiliza uma estrutura de dados chamada [fila](https://foxtechworld.github.io/2023/05/fila/) para rastrear os vértices a serem visitados. 

Inicialmente, o vértice de origem é inserido na [fila](https://foxtechworld.github.io/2023/05/fila/). 

Em seguida, o algoritmo inicia um loop principal até que a [fila](https://foxtechworld.github.io/2023/05/fila/) esteja vazia. 

A cada iteração do loop, o algoritmo retira o vértice da frente da [fila](https://foxtechworld.github.io/2023/05/fila/) e o visita, marcando-o como visitado. 

Em seguida, o algoritmo examina todos os vizinhos não visitados desse vértice e os insere na [fila](https://foxtechworld.github.io/2023/05/fila/). 

Dessa forma, garante-se que os vértices sejam visitados em uma ordem que respeite sua distância em relação ao vértice de origem.

```cpp
#include <iostream>
#include <queue>
#include <vector>

using namespace std;

// Função para realizar BFS em um grafo
void bfs(vector<vector<int>>& graph, int startVertex) {
    // Vetor para rastrear os vértices visitados
    vector<bool> visited(graph.size(), false);

    // Fila para rastrear os vértices a serem visitados
    queue<int> queue;

    // Marcar o vértice inicial como visitado e inserir na fila
    visited[startVertex] = true;
    queue.push(startVertex);

    while (!queue.empty()) {
        // Obter o próximo vértice da fila
        int currentVertex = queue.front();
        queue.pop();

        // Processar o vértice atual
        cout << "Visitando vértice: " << currentVertex << endl;

        // Percorrer os vizinhos do vértice atual
        for (int neighbor : graph[currentVertex]) {
            if (!visited[neighbor]) {
                // Marcar o vizinho como visitado e inserir na fila
                visited[neighbor] = true;
                queue.push(neighbor);
            }
        }
    }
}

int main() {
    // Exemplo de um grafo representado por uma lista de adjacência
    vector<vector<int>> graph = {
        {1, 2},     // Vértice 0
        {0, 2, 3},  // Vértice 1
        {0, 1, 3},  // Vértice 2
        {1, 2, 4},  // Vértice 3
        {3}         // Vértice 4
    };

    // Chamar a função BFS a partir do vértice 0
    bfs(graph, 0);

    return 0;
}
```

Vou fazer um microbenchmark rapidinho para mostrar qual a diferença percorrendo um grafo com 30 vertices na força bruta e com bfs usando python.


###### Exemplo de força bruta 
```python
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

###### Exemplo usando bfs

```python
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

###### E o resultado do benchmark foi 

| Comando    | Time    | Consumo    |
|---------------- | --------------- | --------------- |
| python3 brute_force.py    | 0,08s user 0,06s system    | 130% cpu 0,106 total |
| python3 bfs_search.py | 0,06s user 0,04s system | 114% cpu 0,083 total |


Pode parecer que ouve pouca diferença, mas aqui estamos trabalhando com um grafo muito pequeno com apenas 14 vertices.

Em grandes grafos usamos o bfs pois ele:

- O algoritmo BFS é otimizado para percorrer grafos de forma eficiente e sistemática.

- Ele visita todos os vértices de um determinado nível antes de passar para o próximo nível.

- O BFS é ideal para encontrar caminhos mínimos, alcançabilidade, componentes conectados e outros problemas relacionados.

- Sua complexidade de tempo é proporcional ao número de vértices e arestas alcançáveis a partir do vértice de origem.

E evitamos a força bruta pois ela:

- O brute-force considera todas as combinações possíveis de vértices para verificar a existência de uma aresta.

- Ele percorre todas as combinações sem otimizações, o que pode levar a um tempo de execução mais longo.

- O brute-force é útil para casos em que é necessário verificar todas as combinações possíveis, mas pode ser impraticável em grandes grafos devido ao tempo de execução alto.

- Sua complexidade de tempo é proporcional ao número total de pares de vértices no grafo.


Caso você deseje saber mais sobre a implementação de grafos no C++ eu recomendo [este repositorio](https://github.com/boostorg/graph/tree/develop/example) da biblioteca boost.
