# Customizações Realizadas no Projeto

## 📌 Alterações Principais

### 1. **Região AWS**
- Alterado de `ap-south-1` para `us-east-1`
- Ajuste realizado em `provider.tf`

### 2. **Instalações na EC2**
```bash
# Docker
sudo apt install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/sources.list.d/docker.list > /dev/null
sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
usermod -aG docker $USER
newgrp docker

# Terraform, kubectl já vinham instalados
```

### 3. **Comandos de Deployment**
```bash
cd Deployment-of-super-Mario-on-Kubernetes-using-terraform/EKS-TF
terraform init -reconfigure
terraform plan
terraform apply --auto-approve
aws eks update-kubeconfig --name EKS_CLOUD --region us-east-1
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl get all
kubectl describe service mario-service
```

### 4. **Troubleshooting Realizado**
- Região incorreta → corrigida para us-east-1
- Reconfigured Terraform backend
- Validação de cluster com `terraform state list`
- Verificação de nodes com `kubectl get nodes`
- Destruição e recriação do cluster para ajustes

## 🔑 Configurações Críticas
- **Cluster Name**: EKS_CLOUD
- **Region**: us-east-1 (customizado)
- **Service Type**: LoadBalancer
- **Application**: Super Mario Game
