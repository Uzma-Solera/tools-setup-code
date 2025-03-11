infra:
       git pull
       terraform init
       terraform apply -auto-approve

ansible:
        git pull
        anisble-playbook -i $(tool_name)-internal.uzma83.shop, setup-tool.yml -e ansible_user=ec2-user -e ansible_password=DevOps321  -e tool_name=$(tool_name)

secrets:
        git pull
        cd misc/vault-secrets ; make vault_token=$(vault_token)
