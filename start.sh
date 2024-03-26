## Script de inicialização de todo o projeto
echo "Iniciando máquina via Vagrant"
cd vagrant;
vagrant up

## Pega a chave SSH da máquina Vagrant
echo "Capturando diretório da chave e salvando em arquivo hosts do ansible"
priv_key=$(vagrant ssh-config | grep IdentityFile | cut -d ' ' -f 2- | sed 's/IdentityFile *//') ;
echo "ansible_ssh_private_key_file=$priv_key" >> ../ansible/hosts ;

## Status da máquina
vagrant status

echo "Iniciando playbook para provisionamento"
cd ../ansible;
ansible-playbook -i hosts devops-host.yml
