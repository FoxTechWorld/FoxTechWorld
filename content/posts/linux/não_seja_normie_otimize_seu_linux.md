---
title: "Não seja normie, otimize seu linux"
date: 2023-05-07T14:54:46-03:00
description: "Otimizando o linux like a pro"

categories:
  - "Geek"
  - "Tecnology"
tags:
  - "OpenSource"

comments: true
authorbox: true
mathjax: true
---

##### O que é linux?
O linux é um dos 3 grandes sistemas operacionais, e assim como MacOSX ele puxa as ideias do Unix.

Não confunda (linux não é Unix, e o MacOSX não segue os preceitos do Unix). 

Tanto que o kernel Xnu da apple significa (X is not Unix), mais ainda sim ambos são suficientemente compativeis para ter compatibilidade em nível de código fonte.

```

Para quem é mais técnico, o linux em si não é um sistema operacional completo, ele é apenas um núcleo como o NT (kernel do Windows) e o XNU (kernel do MacOSX).
Na maioria das distribuições usamos ferramentas gnu sobre o linux (apesar de já não ser mais a norma), hoje em dia temos centenas de distribuições e trabalhos.

```

Ou seja, tudo o que eu codar no linux só preciso recompilar no MacOSX para rodar (não é tão simples assim em alguns casos, mas pode ocorrer em outros).

Enfim, se você está fugindo do Windows e quer começar a ter uma experiencia Unix, vá para o linux.

Hoje em dia o linux roda na maioria dos Hardwares suficientemente bem. 



Então bora deixar de ser normie e começar a customizar essa bagaça.

Os passos são bem simples do que você tem que fazer.

1. Verifique se seu pc está compondo pelo sua gpu, caso não esteja você está sendo sacaneado pelo sistema.

```bash
glxinfo | grep "direct"
```

Caso o sistema reclame que você não tem o comando glxinfo, ele pertence ao `mesa-utils`.

2. Evite deixar o equilibrio do descarregamento de dados do seu aplicativo entre ram e swap.
Isso mesmo, seja agressivo e bote tudo na ram.

**Ram:** Mim de papai

```bash
sudo tee -a /etc/sysctl.d/99-sysctl.conf <<-EOF 
vm.swappiness=1 
vm.vfs_cache_pressure=50 
EOF

sudo tee -a /etc/sysctl.d/99-sysctl.conf <<-EOF 
vm.dirty_background_bytes=16777216 
vm.dirty_bytes=50331648 
EOF
```

Esses comandos vão garantir que o sistema rode com o máximo de tempo real possível, não estamos melhorando performance.
Estamos fazendo o kernel parar de engasgar e parar. E isso deve funcionar com maior visibilidade em HD's do que em SSD's.

Ajustou corretamente, agora faça o seguinte reboota ou reboota quando terminar de modificar.

3. Configure seu agendador de E/S, você pode verificar digitando o seguinte comando:

```bash
cat /sys/block/{seu dispositivo}/queue/scheduler
```

substitua o `{seu dispositivo}` pelo nome do armazenamento sendo usado. No meu caso um ssd nvme com o scheduler kyber que é especializado para uso de nvme.

Para modificar o agendador você pode usar o echo

```bash
echo kyber > /sys/block/nvme0n1/queue/scheduler
```

no meu caso eu estou usando o melhor agendador então não vou modificar

4. Verifique se seu kernel é generico ou zen

Se seu kernel for generico, você pode querer substituir pela versão zen que é mais otimizada para desktop.
Mas já deixo um aviso, trocar de kernel não é trivial, é uma coisa complexa que deve ser praticada nos minimos detalhes para você não quebrar seu sistema.
Mantenha um backup e um livecd pronto para corrigir qualquer alteração.

5. CpuPower

Agora vamos configurar nossa Cpu para usar a capacidade em demanda. Para isso vamos usar o comando cpupower (vem por padrão no manjaro).

Para isso vamos customizar no diretório `/etc/default/cpupower` e ativar o governor para usar "on_demand" ou "performance" no meu caso que é um notebook eu deixo em on_demand
Se eu tivesse no desktop eu customizaria para usar performance.

Não esqueça de ativar o cpupower no systemd

```bash
systemctl enable cpupower
```

6. Ananicy

Ananicy é um daemon disponivel no aur para ajuste automático de uso da cpu, após instalado é só rodar o comando 

```bash
systemctl enable ananicy
```

Com esse conjunto de texto podemos ter uma boa ideia de como customizar o linux para ter uma performance(tempo real).

Isso não é uma configuração definitiva, cada pc tem uma configuração e está apenas uma configuração geral. 

Você deve tomar responsabilidade de pesquisar sobre sua maquina e tirar o melhor dela, no ponto de que antigamente a computação era mais qualificada pois todos sabiam tirar o melhor de uma maquina fraca, agora tire o melhor de uma maquina forte.

Apesar de esse ser um post em especifico sempre vale a pena ler a archwiki para descobrir novas formas de retirar o máximo da sua maquina.
