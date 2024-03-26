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

## Iniciando projeto na máquina com Ansible
echo "Iniciando playbook para provisionamento"
cd ../ansible;
ansible-playbook -i hosts devops-host.yml

## Inserindo dados na API
# matéria 1
curl -sv localhost:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"alice@example.com","comment":"first post!","content_id":1}'
curl -sv localhost:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"alice@example.com","comment":"ok, now I am gonna say something more useful","content_id":1}'
curl -sv localhost:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"bob@example.com","comment":"I agree","content_id":1}'

# matéria 2
curl -sv localhost:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"bob@example.com","comment":"I guess this is a good thing","content_id":2}'
curl -sv localhost:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"charlie@example.com","comment":"Indeed, dear Bob, I believe so as well","content_id":2}'
curl -sv localhost:8000/api/comment/new -X POST -H 'Content-Type: application/json' -d '{"email":"eve@example.com","comment":"Nah, you both are wrong","content_id":2}'

