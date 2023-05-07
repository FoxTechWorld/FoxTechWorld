---
title: "Implementando e finalizando o brain va"
date: 2023-05-07T09:07:28-03:00
description: "Implementando as funções da factory do Brain VA e finalizando o projeto"

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

Chegamos ao ponto final do projetos onde falta terminar de implementar as classes do factory e torna-lo funcional.
Nesse caso vamos começar trabalhando com o contéudo da classe `WikipediaSearch`, essa classe vai fazer apenas uma coisa, pesquisar o contéudo da wikipedia e retornar o mesmo.
No caso eu defini um __init__ para receber o termo que será pesquisado, e como implementação do search, a classe Wikipedia gera uma pequena select list para não haver desambiguação ou falha na pesquisa.

```python
class WikipediaSearch:
    def __init__(self, term) -> None:
        self.term = term
        pass

    def search(self):
        import wikipedia

        wikipedia.set_lang("pt")
        results = wikipedia.search(self.term)
        
        print(f"Encontrados {len(results)} resultados para {self.term}: ")
        
        for i, result in enumerate(results):
            print(f"{i + 1}. {result}")
        
        choice = input("Selecione o número do artigo desejado (ou pressione ENTER para o primeiro resultado): ")
        
        try:
            index = int(choice) - 1
            if (index < 0 or index >= len(results)):
                index = 0
        except ValueError:
            index = 0
        
        page = wikipedia.page(results[index])
        return page
pass
```

Repare que a importação do módulo da Wikipedia ocorre dentro da função search. Isso normalmente não é recomendando em códigos onde a chamada do módulo ocorre em escopo global (ou seja, o código do módulo da wikipedia é chamado a todo momento).
Mas como eu só preciso da funcionalidade do mesmo em escopo local, decidi deixar dentro da função.

Repare também que nosso código tem um pequeno tratamento de erro, onde o valor index que é a seleção da desambiguação for menor que zero ou invalido, o mesmo se torna o primeiro valor.
Isso garante que não haja uma quebra bruta do sistema onde o mesmo será implementado.

Com isso terminado, vamos começar a implementar a classe `gpt3` que irá usar a Api da OpenAI para converter o texto da Wikipedia em fatos e regras de prolog ("Te garanto que a inferencia lógica vale o trabalho").
Mas antes vamos criar uma função que sanitize o contéudo da wikipedia, ele será externo a factory, como se fosse o funcionário que faz a manutenção do mesmo.

```python
def sanitize(content):
    import html2text
    from bs4 import BeautifulSoup
    sanitized_content = BeautifulSoup(content, 'html.parser').get_text()
    convert = html2text.HTML2Text()
    content = convert.handle(sanitized_content)
    return content
```

No caso utilizamos duas libs para sanitizar o contéudo, o html2text e o BeautifulSoup, primeiramente parseamos o html usando o BeautifulSoup em seguida convertemos o html restante usando html2text e finalizamos retornando o texto.
Com isso garantimos um texto legível humanamente e podemos usar esse texto mesmo sem passar pela api da OpenAI.

Agora implementamos a classe do gpt3

```python
class Gpt3:
    def __init__(self, prompt) -> None:
        self.prompt = prompt
        pass

    def generate(self):
        from dotenv import load_dotenv
        import openai
        import os
        load_dotenv()
        openai.api_key = os.getenv("OPENAI_API_KEY")
        openai.organization = os.getenv("ORG_ID")
        response = openai.Completion.create(
            engine='text-davinci-003',
            prompt=self.prompt,
            max_tokens=1024
        )
        return str(response)
pass
```

Essa classe tem um construtor que o prompt que será utilizado, e uma função generate que chama sua api da OpenAI a partir de arquivo .env, e usa o text-davinci-003 para gerar o código em prolog.
claro que nesse momento, ele não sabe o que fazer, por isso puxamos o prompt no construtor e depois usa a função generate para gerar o código prolog contendo as regras e os fatos sobre o texto e retorna o código gerado.

Com isso terminado, vamos trabalhar na classe `PrologFile`

```python
class PrologFile:
    def __init__(self, term, content):
        self.filename = str(term) + ".pl"
        self.content = content
        pass

    def create(self):
        with open(self.filename, 'w') as file:
            file.write(self.content)
        pass
pass
```

Essa é a mais simples classe que trabalhamos até agora, ela tem um construtor que recebe o termo no qual estamos trabalhando adquirido pela classe `WikipediaSearch` e o conteúdo que será gerado pela classe `gpt3` e os usa para gerar o arquivo pela função create.

Com isso terminado só falta terminar a classe factory que fará a união de todos esses códigos.

```python
class ChatBotFactory:
    def create_chatbot(self, term):
        wikipedia_search = WikipediaSearch(term)
        page = wikipedia_search.search()
        content = sanitize(page.content)
        prompt = f"gere um código em prolog definindo regras e fatos sobre o texto a seguir:\n" + content
        gpt3 = Gpt3(prompt)
        prolog = gpt3.generate()
        prolog_file = PrologFile(term, prolog)
        prolog_file.create()
        pass
pass
```

Essa classe é um pouquinho maior, mas ao mesmo tempo veja como estamos utilizando as classes anteriores.
começamos que a classe ChatBotFactory tendo apenas a função create_chatbot, que recebe tudo da classe e o termo que vamos usar.

Começamos utilizando a classe WikipediaSearch passando o termo no constructor da classe, e em seguida usando a função search paraa selecionar a página e adquirir o conteúdo.

Em seguida usamos a função sanitize para transformar o conteúdo da página em texto plano.

Usamos o prompt que gera o código em prolog passando o contéudo

E passamos esse prompt para a classe Gpt, depois geramos usamos a função generate e passamos para a classe PrologFile junto do termo da pesquisa, assim executamos a função create e geramos o arquivo prolog.

Com essa combinação temos uma aplicação que gera código prolog que pode compilado/linkado e ter um prompt de pesquisa.

[Finalizando projeto](https://foxtechworld.github.io/2023/05/implementando-e-finalizando-o-brain-va/)
