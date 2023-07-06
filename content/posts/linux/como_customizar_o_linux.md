---
title: "Como vou customizar meu proxímo linux"
date: 2023-06-29T09:40:29-03:00
description: "Algumas dicas do Kitsune para tornar seu linux melhor"
author: "KitsuneSemCalda"
categories:
  - "Geek"
  - "Plaining"
  - "Tecnology"
tags:
  - "OpenSource"

comments: true
authorbox: true
mathjax: true
---

Olá de novo, Kitsune aqui. Hoje vim explanar uns pensamentos que estou tendo sobre customização do linux.

Para quem não sabe estou usando este setup:

```
- CPU: Intel i5 11ªgen
- Memória Ram: 8GB Ram DDR4
- Placa de Vídeo: Intel Iris Xe 
- Armazenamento: SSD NVME 256GB
```

e sim, pretendo fazer um upgrade com um pente de 32GB Ram e um HD de 1Tb ou 2Tb (meio overkill não é?).

Enfim, para quem não sabe estou fazendo faculdade e pretendo nas proximas férias começar alguns projetos inspirado em algumas coisas que curto, acompanhe a categoria de future projects onde vou falar mais sobre isso.

Mas o primeiro passo é fazer uma formatação do meu pc, estou interessado em migrar para o Arch Linux fazendo uma customização mínima, não sei porque existe essa divisão no Linux onde um usuário só pode ser visto como intermediário assim que instala o Arch puro.

```
Instalar arch puro é basicamente seguir todas as etapas da arch wiki sem o apoio do archinstall, ou sem usar uma iso custom que facilite
```

minhas ideia é basicamente instalar um KDE minimo (com um [Rice de MacOS](https://www.youtube.com/watch?v=y4yPm9s3KVg&ab_channel=LinuxScoop), e não me julgue por gostar da estetica da apple), talvez colocar um [conky ao canto esquerdo](https://www.youtube.com/watch?v=mIdIuRuVOkc&ab_channel=OPinguimCriativo) de forma que fique belo ao desenvolvedor mostrando informações uteis.

Mas para customização de mais baixo nível teria mais algumas coisas que eu gostaria de fazer, começando por instalar:

- BleachBit
- Timeshift
- Timeshift-autosnap

O [BleachBit](https://www.bleachbit.org/) é um ccleaner para linux, quem veio do windows deve conhecer, ele serve para você conseguir limpar o sistema periodicamente de forma que seu espaço não seja constantemente gasto com coisas inuteis.

O [Timeshift / Timeshift-autosnap](https://soulinux.com/blog/item/18-timeshift) é um app para agendar backups no seu linux, de forma que você consiga restaurar dados antigos em caso de perca. (por favor use btrfs ao invês de rsync (vou esplicar))

```
Quando usamos btrfs para fazer backup não criamos uma cópia exata do arquivo somente aquilo que foi modificado usando Copy-on-Write (CoW).
O Rsync faz uma cópia exata do arquivo. Podemos dizer que com rsync você gasta 2x o mesmo espaço para um backup (forma burra), até porque o rsync foi criado para fazer backup em outros dispositivos externos.
```

Já o TimeShift autosnap serve para definir a quantidade de snapshots máxima que você quer no seu sistema (comigo é no máximo 3, sendo elas criadas com btrfs usando CoW). Basicamente seguindo este outro [tutorial](https://www.lorenzobettini.it/2022/07/timeshift-and-grub-btrfs-in-linux-arch/) de forma que o grub se atualize após a inclusão ou exclusão de um snapshot.

Acho interessante manter algumas coisas em low-level também então vou seguir as dicas do meu tutorial sobre [otimização do linux](https://foxtechworld.github.io/2023/05/n%C3%A3o-seja-normie-otimize-seu-linux/). E claro fazer algumas pesquisas mais avançadas de customização do sistema operacional como as sugeridas pela [Arch Wiki](https://wiki.archlinux.org/title/improving_performance) e de um [cara secundário no linkedin que fez um post bacana sobre otimização](https://www.linkedin.com/pulse/how-make-your-archlinux-faster-sourav-goswami/).

- Ativar a desfragmentação automatica do Btrfs
- Ativar a compressão do Btrfs
- Usar Zram ao invês de swap de disco (basicamente estamos compactando a memória ram ao invés de escrever no disco).
- Sortear os serviços por tempo de carregamento (vamos carregar os mais rápidos primeiro).
- Como vou estar usando NetworkManager + Wpa_Supplicant, vou desativar o systemd-resolver.
- Configurar o DNS para usar o da google e da cloudflare.
- Tornar o arquivo resolv imutável.
- Usar clang como compilador adequado do yay | pacman. (lembrar de adicionar as flags: `-mtune=native -march=native -O3 -pipe`)

lembrando que:

```
-O3, é o máximo de otimização sem quebrar o bínario.
-mtune=native | -march=native, fazem o pacote exclusivamente para o sistema.
-pipe não afeta o binário mas torna a compilação mais rápida.
```

- Usar noatime ao montar as partições
- Usar preload

É uma grande lista de novas configurações (muitas perigosas e outras não), mas que vão tornar meu novo sistema muito agradável para uso.

É bem provavel que bote meus testes em maquinas virtuais dentro do meu [servidor do discord](https://discord.gg/X3eaQk3bJN).

E para finalizar de forma não menos importante, a lista de coisas que pretendo instalar no meu novo sistema:

- Neovim || Meu editor de texto de terminal favorito
- Google-Chrome || Um navegador web
- Firefox || Outro navegador
- Tor || Mais um navegador (pode me chamar de Pedro Alvares Cabral)
- OnlyOffice || Uma suite de edição de documentos
- FreeTube || Um bom cliente para o Youtube
- Thunderbird || O melhor cliente de email que conheço
- Obsidian || Onde faço minhas anotações

Muito talvez, eu instale algo além disso (tirando minhas ferramentas dev que provavelmente vou comentar em outro post). E algumas ideias de momento que vou tentar fazer mais a frente.
