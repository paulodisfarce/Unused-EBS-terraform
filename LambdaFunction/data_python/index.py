import os
import boto3

def lambda_handler(event, context):
    try:
        # Inicializa o cliente EC2
        ec2 = boto3.client('ec2')
        
        # Lista todos os volumes EBS
        response = ec2.describe_volumes()

        # Lista de volumes EBS para excluir
        volumes_to_delete = []

        # Verifica se cada volume não está anexado a nenhuma instância em execução
        for volume in response['Volumes']:
            if len(volume['Attachments']) == 0:
                # Verifica se o volume não tem a tag "Environment" com o valor "Prod"
                if 'Tags' in volume:
                    tags = {tag['Key']: tag['Value'] for tag in volume['Tags']}
                    if 'Environment' in tags and tags['Environment'] != 'Prod':
                        volumes_to_delete.append(volume['VolumeId'])
                else:
                    volumes_to_delete.append(volume['VolumeId'])

        # Exclui os volumes EBS que não estão anexados a nenhuma instância
        for volume_id in volumes_to_delete:
            ec2.delete_volume(VolumeId=volume_id)

        return {
            'statusCode': 200,
            'body': 'Volumes EBS não utilizados foram excluídos com sucesso.'
        }
    except Exception as e:
        sns = boto3.client('sns')
        response = sns.publish(
            TopicArn = os.environ['SNS_TOPIC_ARN'],
            Subject = 'Erro na execução da função Lambda',
            Message = f'O seguinte erro ocorreu na execução da função Lambda:\n{str(e)}'
        )
        
        # Retorna uma resposta de erro
        return {
            'statusCode': 500,
            'body': 'Ocorreu um erro durante a execução da função Lambda. Detalhes foram enviados por e-mail.'
        }
