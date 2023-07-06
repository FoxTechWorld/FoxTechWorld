---
title: "FoxBSD"
date: 2023-07-04T09:43:48-03:00
description: "Meu futuro projeto: Um OS Unix-Like"
author: "KitsuneSemCalda"

categories:
  - "Tecnology"
  - "Plaining"
tags:
  - "OS Dev"
  - "Do It Yourself"

comments: true
authorbox: true
mathjax: true
---

Sim, eu tenho essa ideia de criar um [sistema operacional Unix Like](https://pt.wikipedia.org/wiki/Sistema_operacional_tipo_Unix) desde novinho, algo similar aos [sistemas BSD](https://pt.wikipedia.org/wiki/Berkeley_Software_Distribution) misturando um pouco de [Linux](https://pt.wikipedia.org/wiki/Linux) e [Darwin-Xnu](https://pt.wikipedia.org/wiki/Darwin_(sistema_operacional)). 
A ideia é seria um sistema eficiente em uso de máquinas fracas usando uma versão bastardizada do [DLSS](https://en.wikipedia.org/wiki/Deep_learning_super_sampling) da Nvidia feito de forma (without IA) usando algum algoritmo eficiente em openCL. Imagine um [renderizador blender](https://pt.wikipedia.org/wiki/Blender) rodando em um hardware modesto com performance aceitável para a máquina.

Uma das principais conjucturas do FoxBSD seria ele ter a mesma capacidade de customização do Linux, mas ser por padrão (auto-regulavel) ou seja conseguir tomar as melhores decisões sobre performance por padrão sem afetar muito a parte gráfica e a baixa latencia que buscamos, ou seja um usuário leigo não precisaria ficar cavucando um monte de configurações para melhorar seu sistema em determinados casos, muito menos ficar tendo de consertar os problemas do sistema. Como acontece no Windows e nas Distribuições Linux. O sistema deve ter uma usabilidade absurda.

E diferente de sistemas operacionais Gnu/Linux onde existe todo um mambo-jambo para rodar software proprietário dentro do Linux (ou algo incoeso), o FoxBSD deve ter uma loja de apps diversificada e com cada software auditado para poder ter softwares (Livres, Abertos, Gratuitos, Pagos ou Fechados) seguindo uma ideia de que o usuário final precisa das ferramentas que usa.

Para manter a coerencia do sistema em apps portados eu pensei em criar softwares com api's compatíveis.

- CGR -> Common Graphics Render: Um servidor gráfico que busca ter api's compatíveis com [Wayland](https://pt.wikipedia.org/wiki/Wayland_(protocolo_de_servidor_gr%C3%A1fico)) e [X11](https://pt.wikipedia.org/wiki/X_Window_System), além de usar o BSS (Bastarded Super Sampling) para renderizar os gráficos de forma a aumentar a performance mesmo em placas integradas.
- CAR -> Common Audio Render: Um servidor de aúdio que busca ter api's compatíveis com [Jack](https://wiki.archlinux.org/title/JACK_Audio_Connection_Kit), [PulseAudio](https://pt.wikipedia.org/wiki/PulseAudio) e [Pipewire](https://pt.wikipedia.org/wiki/PipeWire). 
- CGT -> Common Grafic Toolkit: Um toolkit gráfico com api's compatíveis com [GTK](https://pt.wikipedia.org/wiki/GTK) e [QT](https://pt.wikipedia.org/wiki/Qt).

Isso lembrou que o scheduler não seria justo, pois iria forçar a baixa latência como prioridade do sitema (qualquer ação com flag "Desktop" aumenta imediatamente de prioridade) enquanto qualquer outra coisa iria imediametamente para background (para não parar o processamento).

A maior vantagem de termos sistemas "C" ou Common como os citados acima é a capacidade de portar softwares livres ou abertos sem muita necessidade de ter a dor de cabeça em se preocupar se estamos usando X.org ou Wayland, Pipewire ou PulseAudio, Qt ou GTK e ficar com um [inferno de depedencias](https://en.wikipedia.org/wiki/Dependency_hell) no nosso sistema.

No geral e para maioria dos desenvolvedores ainda teriam que se preocupar com dependencias mas novamente, pro usuário as coisas mais importantes seriam mantidas limpas (sem preocupação e sem dor de cabeça no uso de seus aplicativos), novamente coeso. É como se todos os desenvolvedores apple usassem o [cocoa](https://en.wikipedia.org/wiki/Cocoa_(API)) que já é pertencente ao [mac OSX](https://en.wikipedia.org/wiki/MacOS) e por isso não existisse a  necessidade de instalar o QT / GTK ... ou qualquer outro toolkit gráfico.

Tá bom? calma que melhora. O FoxBSD também teria uma quantidade de software's próprios gratuitos disponiveis na loja usando as api's "C" (nomeei as api's common de "C") me julguem. 

Vamos também priorizar o modo hibernar em zswap ao suspender que vem por padrão em linux, windows e MacOSX (Notebooks agradecem). E vamos usar Zram ao invês do Swap para salvar memória.

Além disso, cada software vai ter um sistema de flags para serem executados. Uma coisa que fico pensando é como manter uma experiencia coesa (Testes de unidade, (Posso evitar bisbilhotar o código fonte usando o GDB (ou LLDB)) injetando testes (acho)) de forma que eu posso espelhar as configurações dos testes de forma publica na documentação da loja e do developer guidelines // Human-Guide Interface. 

Assim podemos ter certeza que o código tenha performance e segurança o suficiente para ser públicado na loja.

O FoxBSD também teria suporte a coisas como containers (usando cgroups e namespaces), o uso de ACPI, Mesa, Vulkan ... etc em padrões além do POSIX. De forma a manter compatibilidade com a maioria dos sistemas operacionais.

Para finalizar o FoxBSD seria uma distribuição 100% aberta e 100% gratuita.
