# Softwares utilizados

* [Docker](https://docs.docker.com/engine/install/) - Versão 24.0
* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) - Versão 2.10.8 
* [Docker-Compose](https://github.com/docker/compose) - Versão 1.29
* [Vagrant](https://developer.hashicorp.com/vagrant/docs/installation) - Versão 2.2.9
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - Versão 6.1.50

# Inicialização

Caso tenha Docker e docker-compose no host e deseje iniciar:


```bash
docker-compose up -d
```

Assim o projeto será inicializado junto dos containeres de monitoramento Docker.

Caso queira subir direto em um host:
```bash
bash start.sh
```

O script inicia o host do Vagrant, habilita as configurações necessárias com Ansible e no final faz envio dos comentários com o curl.

## Acesso ao Grafana

```bash
user: admin
passwd: admin
```

# Comentários

* 26/03 10:25 : Iniciei o projeto criando a imagem Docker em Alpine, pois é uma imagem pequena e sempre que possível, gosto de utilizá-la para economizar alguns bytes em disco. Aproveitei e fiz a limpa de alguns arquivos que foram enviados no git inicial
* 26/03 12:20 : Estava verificando as possibilidades de usar a AWS na modalidade free tier, mas o meu período de teste já havia esgotado. Com isso, decidi utilizar o Vagrant + VirtualBox para hostear o projeto. 
* 26/03 13:34 : Iniciei o script de criação da máquina fazendo um teste de ping para o host recém iniciado. Nesse script, eu salvei o diretório da chave privada no arquivo hosts para que o ansible consiga se conectar. Também foi necessário adicionar o skip de verificação de chave para que o processo flua sem precisar confirmar se confia na chave do host.
* 26/03 15:47 : Estou verificando todos esses problemas de conexão que o Cadvisor + Prometheus + Grafana está tendo. Optei por esse trio, pois tecnicamente seria mais simples de configurar. Criei uma dashboard bem padrão e agora estou tentando ajustar esse leve problema.
* 26/03 16:40 : Depois de conseguir ajustar o problema dos containers, colocando todos em uma mesma rede. Ao fazer o teste de deploy na máquina disponibilizada pelo vagrant, o docker-compose estava com uma versão diferente. Alterei a playbook para instalar a versão correta e validei mas acabei recebendo outro erro, onde a api python não respondia.
* 26/03 17:02 : Foi necessário incluir o paramêtro "-b 0.0.0.0:8000" para que a api respondesse para todos os hosts

## Considerações Finais

Gostaria de ter conseguido utilizar o GitLab junto da AWS para hostear o aplicativo, mas tive problemas de assinatura por já ter utilizado o período gratuito em outros tempos. Fiquei com muita curiosidade e acabei criando um script de esteira (.gitlab-ci.yml), mas não consegui validar pelos motivos citados acima.

