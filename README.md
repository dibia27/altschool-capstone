﻿# Microservices-Based Application Deployment on Kubernetes
 
This repository contains the Infrastructure as Code (IaaC) setup for deploying a microservices-based architecture application on Kubernetes. The application is based on the [Socks Shop Microservice Application](https://github.com/microservices-demo/microservices-demo.git)

## Setup Details

1. Provisioning Infrastructure The infrastructure is provisioned on AWS using Amazon Elastic Kubernetes Service (EKS). The setup includes creating the necessary AWS resources for Kubernetes cluster provisioning.

2. Kubernetes Configuration Kubernetes configuration files are provided in the infrastructure folder. These files define the Kubernetes resources required to deploy the microservices application. The configuration includes deployment manifests, service definitions, and Kubernetes resources.

3. Continuous Integration and Continuous Deployment (CI/CD) Continuous Integration and Continuous Deployment (CI/CD) pipelines are set up for automated application testing, building, and deploying. The CI/CD pipeline utilizes GitOps principles and ArgoCD for managing deployments. The deployment workflow is triggered automatically upon changes to the repository.

## Prerequisites
1. AWS CLI installed 
2. kubectl installed
3. Terraform installed 
4. ArgoCD installed 
5. GitOps action

![image-401-1024x421](https://github.com/dibia27/altschool-capstone/assets/129342380/2e851c11-c008-406b-ad76-f153f8cc10cd)

## Directory Structure
infrastructure | |-- main.tf | |-- variables.tf | |-- terraform.tf | |-- LICENSE | |-- .terraform.lock.hcl | |-- .gitignore
|-- manifest-logging | |-- elasticsearch.yml | |-- elasticsearch.yml | |-- fluentd-cr.yml | |-- fluuentd.daemon.yml | |-- fluentd-sa.yaml | |-- kibana.yml

|-- manifest-monitoring | |-- monitoring-ns.yaml | |-- prometheus-sa.yaml | |-- prometheus-cr.yaml | |-- prometheus-crb.yaml | |-- prometheus-configmap.yaml | |-- prometheus-alertrules.yaml | |-- prometheus-dep.yaml | |-- prometheus-svc.yaml | |-- prometheus-exporter-disk-usage-ds.yaml | |-- kube-state-sa.yaml | |-- kube-state-cr.yaml | |-- kube-state-crb.yaml | |-- kube-state-dep.yaml | |-- kube-state-svc.yaml | |-- grafana-configmap.yaml | |-- grafana-dep.yaml | |-- grafana-svc.yaml | |-- grafana-import-dash-batch.yaml | |-- prometheus-node-exporter-sa.yaml | |-- prometheus-node-exporter-daemonset.yaml | |-- prometheus-node-exporter-svc.yaml

To deploy the microservices application, first, clone this repository using this command:

`git clone https://github.com/microservices-demo/microservices-demo.git`

Then input the following commands:

```bash
cd infrastructure
terraform init
terraform apply
```

After that, you'll be able to see your Elastic Kubernetes Cluster (EKS) on your AWS console. To see the status of nodes in your cluster, input this command:

`kubectl get node`

After that, install Argo cd using the following commands:

 ```bash
kubectl create namespace argocd
 kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

After installation of Argo cd, use this command to ensure it's installed on your cluster:

`kubectl get pods -n argocd`

 Next, you'll need to allow Port forwarding for the ArgoCD CLI. Use this command to do so:

 `kubectl port-forward svc/argocd-server -n argocd 8080:443` 

 After that, sign into Argo CLI using PowerShell. This must be done on PowerShell while running as an Administrator. Use this command:

 `argocd login localhost:8080`

 After that, synchronize the sock-shop on ArgoCLI using this command:

 `argocd app sync helm-sockshop`

 ![Screenshot 2024-03-24 112914](https://github.com/dibia27/altschool-capstone/assets/129342380/8c87e67d-b552-4519-9800-04b4b5551bd3)

 After that, deploy sockshop to your Kubernetes cluster using this command:

 `kubectl port-forward svc/front-end 8079:80 -n sock-shop`

 ![deplpoyed_sock_app](https://github.com/dibia27/altschool-capstone/assets/129342380/d7c67d1b-eba0-4f21-a999-d9ef9aefebde)

 After that, the application will be successfully deployed. 

 To destroy the infrastructure, use this command:

 `terraform destroy`

 

 

