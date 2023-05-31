---
title: "Usando controle de xbox no linux"
date: 2023-05-13T14:16:00-03:00
description: "Joguei Prototype e Dragon Ball Xenoverse usando o meu controle de xbox one no linux"

categories:
  - "Geek"
  - "Tecnology"
tags:
  - "OpenSource"

comments: true
authorbox: true
mathjax: true
---

Poiszé, dessa vez eu configurei bastante.

Hoje configurei meu linux para reconhecer o controle do meu xbox one e passar para a steam.

No geral, configurei bastante.

```
Eu realmente configurei bastante, para no fim descobrir que não era para configurar aquilo tudo ;-; 
```

Apesar de ser algo simples, comecei instalando o [xpad-dkms](https://aur.archlinux.org/packages/xpad-dkms-git). 

Que para quem não sabe é o driver para controllers do xbox.

Após isso, verifiquei se o usb ligado ao meu controller estava sendo visto pelo linux, para isso usei o comando `lsusb` e incrivelmente ele estava.

```
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 002: ID 05c8:023a Cheng Uei Precision Industry Co., Ltd (Foxlink) VGA Camera
Bus 003 Device 010: ID 045e:02d1 Microsoft Corp. Xbox One Controller
Bus 003 Device 003: ID 8087:0aaa Intel Corp. Bluetooth 9460/9560 Jefferson Peak (JfP)
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

Já que estava sendo reconhecido no Bus 003, só faltava instalar o driver para o controlador que eu precisava. Lembra do xone que citei inicialmente.

O comando para instalar o driver dkms foi `sudo modprobe xpad` para abilitar o driver.

Depois foi só partir pro abraço.
