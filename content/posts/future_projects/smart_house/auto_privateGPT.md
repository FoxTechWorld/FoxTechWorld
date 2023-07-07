---
title: "Auto privateGPT"
date: 2023-07-01T16:56:39-03:00
description: "Para uma smart room, que tal adicionar um GPT privado"
author: "KitsuneSemCalda"
categories:
  - "Tecnology"
  - "Plaining"
tags:
  - "Smart House"
  - "Do It Yourself"

comments: true
authorbox: true
mathjax: true
[sitemap]
  changefreq = 'weekly'
  priority = 0.5
---

### Auto PrivateGPT?

Estava utilizando o [privateGPT](https://github.com/imartinez/privateGPT) esses dias, mas como não tenho setup eficiente com uma boa rtx 3080 foi lento, enfim me deu insight's de como cyclar o privateGPT para sempre ir se atualizando com novos dados.

Para isso eu teria a seguinte checklist:

- Um NAS (com diversos HD's para obter muito espaço).
- Um ambiente unix/linux (a ferramenta de rsync e de links simbolicos irão ajudar muito).
- Um setup eficiente com bastante processamento paralelo.

Você pode até conseguir rodar o privateGpt sem o gpu potente, mas vai ser bem lento, qualquer coisas abaixo de uma 3080 não vai ter respostas em velocidade de chatgpt no minimo vai levar alguns minutos para uma resposta.

Para isso você deve ter o conceito de reactor fresco na sua mente, como no exemplo dado neste [post](https://foxtechworld.github.io/2023/06/smart-room/). Vamos usar uma rotina de tempo.

### Usando Reactor para digerir dados automaticamente

Durante o dia, você vai gerando arquivos / baixando arquivos ... etc e movimentando dados no seu computador, provavelmente (e se tu for esperto) você vai configurar para que o armazenamento do computador seja secundário ao armazenamento em NAS com raid. A partir dai, basta construir um link simbolico que vai conectar o share_documents com o NAS (desorganizado) o proprio NAS deve ser a pasta. 
E a cada 00h PM, o comando de ingest será executado para que seja possivel utilizar as informações do documento.

Ressalvas:

O privateGPT só pode digerir arquivos especificos de tipo:

- PDF
- CSV
- DOCX  
- DOC
- Enex
- Eml
- Epub
- Html
- Md
- Msg
- Odt
- Pdf
- Pptx
- Ppt
- Txt

Então temos duas opções, criamos uma pasta especifica que vai conter os items que serão digeridos e abrimos um link simbolico para está pasta ou usa o NAS inteiro para fazer isso. Eu particularmente prefiro a primeira opção, afinal podemos economizar ainda mais o espaço guardando imagens, vídeos ... etc em outras pastas.

Então suponha que vamos com a primeira opção e criamos uma pasta especifica para os arquivos, vamos usar o rsync direto para envia-los? sua resposta é não. Não vale a pena enviar tudo direto se não sabemos o que estamos enviando, a solução mais obvia é usar uma linguagem de script que primeiro verifica o tipo do arquivo, adiciona numa queue e depois envia um por um.
É mais lento, mas de mesma forma, é mais controlavel, e com isso temos granularidade o suficiente para saber o que estamos adicionando ao share_documents.

### Usando qual modelo?

Além disso, o privateGPT aceita vários modelos e eu estava a fim de usar o [vicuna uncensored com 30B de parametros (lento pra caramba)](https://huggingface.co/TheBloke/Wizard-Vicuna-30B-Uncensored-GPTQ) para poder ter todos os resultados possíveis sem a censura da openAI.

Mais um motivo para eu usar uma 3080 para executar o privateGPT com o modelo do vicuna com velocidade de ChatGPT.

Além disso, eu estou com uma ideia de raspagem de dados para alimentar o privateGPT e possivelmente criar uma api web em flask para montar um assistente virtual.
