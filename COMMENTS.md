# Softwares utilizados

* [Docker](https://docs.docker.com/engine/install/) - Versão 24.0
* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) - Versão 2.10.8 
* [Vagrant]
* [VirtualBox]

# Comentários

* 26/03 10:25 : Iniciei o projeto criando a imagem Docker em Alpine, pois é uma imagem pequena e sempre que possível, gosto de utilizá-la para economizar alguns bytes em disco. Aproveitei e fiz a limpa de alguns arquivos que foram enviados no git inicial
* 26/03 12:20 : Estava verificando as possibilidades de usar a AWS na modalidade free tier, mas o meu período de teste já havia esgotado. Com isso, decidi utilizar o Vagrant + VirtualBox para hostear o projeto. 
* 26/03 13:34 : Iniciei o script de criação da máquina fazendo um teste de ping para o host recém iniciado. Nesse script, eu salvei o diretório da chave privada no arquivo hosts para que o ansible consiga se conectar. Também foi necessário adicionar o skip de verificação de chave para que o processo flua sem precisar confirmar se confia na chave do host.
