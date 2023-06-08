---
title: "Smart Room"
date: 2023-06-06T12:19:03-03:00
description: "Eu quero uma Smart Room e sim, sou preguiçoso e daí?"

categories:
  - "Tecnology"
  - "Plaining"
tags:
  - "Smart House"
  - "Do It Yourself"

comments: true
authorbox: true
mathjax: true
---

Devo começar falando que se você quer montar algo inteligente na sua casa você terá um trade-off, uma troca entre facilidade e privacidade, isso se deve ao fato de que você estará gerando dados sobre tudo o que for automatizado e caso você escolha o caminho fácil você usará uma alexa onde as informações serão enviadas para a Amazon e onde o servidor de aplicação, deles realizará o trabalho.
Pense em usar a Alexa como tomar a pílula azul em Matrix onde você ainda estará acomodado. Agora caso escolha privacidade, você terá que ter seu próprio [servidor de aplicação](https://pt.wikipedia.org/wiki/Servidor_de_aplica%C3%A7%C3%A3o) junto com servidores de armazenamento e alguns auxiliares, esta é uma opção com mais custos pelo controle de informação. Você pode até usar [IaaS](https://www.redhat.com/pt-br/topics/cloud-computing/what-is-iaas) mas voltaria ao estágio inicial de perda de controle sobre as informações, logo é preferivel ter tudo localmente em servidores controláveis.
E apesar de eu falar servidores, não precisa pegar algo caro, pode ser um raspberry pi barato ou algum pc hyper fraco como os da positivo contanto que você possa mante - lo ligado 24/7 além disso você precisa necessariamente se conectar com diversos aparelhos na rede então seria preferivel que você também tivesse uma rede interna e privada caso use a automação mais hardcore da pirula vermelha. Tendo os dois prontos, agora você precisa tomar a decisão, vai utilizar algum projeto pronto ou começar o seu? novamente depende de vários fatores como:

- Até onde você vai utilizar sua estrutura?
- Qual serão o nível das automações? 
- Quais triggers você vai utilizar e etc.

Se pretende ter uma automação avançada, utilize alexa e não pense duas vezes é muito menos trabalhoso do que a implementação manual de coisas como reconhecimento de voz, e interface com alguns objetos. Se quiser encarar o desafio bem ... boa sorte.

Mas o que eu considero automações simples e automações complexas:

| Automações Simples | Automações Complexas        |
|---------------------------------- | ----------------------------------------------|
| Rotinas baseadas em tempo         | Rotinas baseadas em comandos de voz           |
| Rotinas baseadas em sensores      | Rotinas baseads em localidade                 |
| Controle de Temperatura           | Sistema de reconhecimento facial para acesso  |
| Agendamento de tarefas domesticas | Sistema de segurança integrado a cameras      |

Com isso definido, vou dar uma ideia geral de como o servidor de aplicação deveria rodar (na mente mente, nunca cheguei a implementar e pretendo fazer uma Automação Complexa logo Alexa)

- Você precisa de um Daemon expondo um servidor web a rede
- Você precisa de uma estrutura de [Reator](https://en.wikipedia.org/wiki/Reactor_pattern) para pegar os gatilhos de execução e alguma forma de executar a função correspondente como neste exemplo em [Python](https://pt.wikipedia.org/wiki/Python) utilizando o framework [Flask](https://pt.wikipedia.org/wiki/Flask_(framework_web))

```python

# Este Código não está em condições de uso e muitos menos pronto para ser utilizado de verdade
# É de grande importancia que você reescreva-o de forma que ele se torne tolerante a erros e 
# tenha maior capacidade de execução.

import time
import logging
from flask import Flask, request, jsonify

# Configuração do logger
logging.basicConfig(filename='reactor.log', level=logging.ERROR)

app = Flask(__name__)

class Reactor:
    def process_sensor_data(self, sensor_id, data):
        # Lógica para processar os dados do sensor
        # Aqui você pode adicionar sua própria lógica de processamento
        try:
            # Exemplo de processamento do sensor
            processed_data = data * 2
            
            # Simulação de um erro ocasional
            if sensor_id == 2 and processed_data > 10:
                raise ValueError("Erro: Dados do sensor 2 excedem o limite.")

            return processed_data
        except Exception as e:
            logging.error(f"Erro ao processar dados do sensor {sensor_id}: {str(e)}")
            return None

@app.route('/reactor', methods=['POST'])
def process_request():
    data = request.json
    sensor_id = data.get('sensor_id')
    sensor_data = data.get('sensor_data')
    
    if sensor_id is None or sensor_data is None:
        return jsonify({'error': 'Dados do sensor ausentes.'}), 400

    reactor = Reactor()
    processed_data = reactor.process_sensor_data(sensor_id, sensor_data)

    if processed_data is None:
        return jsonify({'error': 'Erro ao processar dados do sensor.'}), 500

    return jsonify({'processed_data': processed_data})

if __name__ == '__main__':
    while True:
        try:
            app.run(debug=True)
        except Exception as e:
            logging.error(f"Erro ao executar o servidor Flask: {str(e)}")
            time.sleep(5)  # Espera 5 segundos antes de tentar novamente
```

Mas suponha-se que não é isso que você queira, talvez um meio termo entre alexa e o desenvovimento manual graças ao software aberto temos opções como o: [CasaOS](https://github.com/IceWhaleTech/CasaOS)
que é basicamente um sistema operacional pequeno e leve para customizar sua casa inteligente com um servidor domestico, uma cloud domestica e uma automação residencial auto-hospedada. Com esse arsenal em mão você pode começar a trabalhar na sua casa inteligente.

Enfim, e para não fugirmos do assunto principal, eu vou deixar a principal lista de ideias com automação que eu faria em meu quarto (por isso o artigo se chama smart-room).

- Alarme Inteligente: Normalmente eu acordo as 6 AM em ponto e começo a cumprir algumas funções meh "repetitivas", então como minha primeira automação eu criaria um alarme inteligente cujas rotinas seriam:
    - Abrir as cortinas / [blackouts](https://suadecoracao.com/dicas-para-escolher-o-tipo-de-cortinas-blackout-na-reforma/) sobre as janelas
    - Iniciar o computador utilizando de [wake on lan](https://pt.wikipedia.org/wiki/Wake-on-LAN) dessa forma meu pc poderia começar as fazer as bagatelas dele de forma autonoma por meio de daemons, depois do café só chegar sentar e trabalhar
    - Abrir as janelas: Não sei vocês mas tenho uma enorme inatividade ao acordar, então nada melhor do que se autoforçar com a luz do sol batendo diretamente na sua cara até que acorde.
- Controle de Temperatura: Puta treco chato você acordar 6 AM em ponto e ter uma temperatura de 7 ºC te esperando para o dia para isso eu posso simplesmente configurar uma automação para que quando a temperatura for maior que 30ºC ou menor que 30ºC ele faça:
    - Regular a temperatura para exatos 30ºC (sinceramente não sei se é só comigo, mas acontece que eu fico confortável por volta dessa temperatura)
    - Verificar temperatura externa por meio de api's online
    - Caso comece a chover, feche as janelas automaticamente
- Modo Sono: Para quem precisa precisa acordar cedo não durma tarde, neste caso eu programaria um modo sono que desabilitaria algumas funções a fim de poupar energia, desligar a luz ... etc.

Novamente essas seriam algumas ideias de automações que tenho para meu quarto inteligente, digo automações uteis pro meu dia a dia, talvez não seja lá tanta coisa, talvez com um setup caseiro eu conseguiria.

Mas ai, eu teria um pouco mais de trabalho com infra e configurações e a "impossibilidade de expansões fáceis". Até porque, expansões são possiveis em setups caseiros com mais trabalho para fazer funcionar. Talvez, muito talvez eu faça em formato servidor caseiro e mostre para vocês no YouTube (se, e somente se eu for fazer).
