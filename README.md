# Unused-EBS Cleanup - with Terraform
Este repositório contém uma solução serverless para automatizar a limpeza de volumes AWS EBS não utilizados. A função Lambda, escrita em Python, identifica volumes sem a tag "Prod" e os exclui.

## Configuração de Automação
O processo de limpeza é automatizado usando serviços da AWS:

1. [Função Lambda]:(https://aws.amazon.com/pt/pm/lambda/?gclid=CjwKCAiAuNGuBhAkEiwAGId4amMr1VyVxKFKHGMD2V-I7uNg9SFvs7ZzKxFCbklwT_ggciBHb-ib1RoCJmAQAvD_BwE&trk=bd068269-b7dc-4d56-81c4-3c5f58721bef&sc_channel=ps&ef_id=CjwKCAiAuNGuBhAkEiwAGId4amMr1VyVxKFKHGMD2V-I7uNg9SFvs7ZzKxFCbklwT_ggciBHb-ib1RoCJmAQAvD_BwE:G:s&s_kwcid=AL!4422!3!651612449177!e!!g!!aws%20lambda!19836375964!149982286511)
A função Lambda escrita em Python para listar e excluir volumes EBS não utilizados com base em critérios específicos.

2. [EventBridge (CloudWatch Events)]:(https://aws.amazon.com/pt/eventbridge/)
Configuração do EventBridge para acionar a função Lambda todas as quartas-feiras e domingos às 3 da manhã, garantindo uma limpeza regular.

3. [Notificações SNS]:(https://aws.amazon.com/pt/sns/)
Implementação do SNS (Simple Notification Service) para enviar notificações por e-mail em caso de erros durante a execução da função.

## Uso
Para utilizar este projeto em seu ambiente AWS. Siga estes passos:

1. Clone o repositório:
```
git clone https://github.com/diogoab/Unused-EBS-terraform.git
```
2. Navegue até o diretório do projeto:
```
cd unused-ebs-terraform
```
3. Atualize as variáveis do Terraform em terraform/main.tf com suas credenciais AWS.

4. Implante a infraestrutura usando o Terraform:
```
$ terraform init
$ terraform plan
$ terraform apply
```
5. Responda 'yes' quando solicitado para prosseguir com o deployment.

6. Monitore a atividade de limpeza e receba notificações por e-mail conforme configurado.

## Autor
- [Paulo H. Nascimento](https://github.com/paulodisfarce)
- README.md - [Diogo Barbosa](https://github.com/diogoab)

## Licença
Este projeto está licenciado sob a Licença MIT - consulte o arquivo LICENSE para obter detalhes. Sinta-se à vontade para contribuir ou modificar o código de acordo com seus requisitos.

Por favor clique na estrela e tenha um código feliz! 🚀
