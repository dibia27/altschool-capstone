terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }

    kubernetes = {
        version = ">= 2.0.0"
        source = "hashicorp/kubernetes"
    }

    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}


data "aws_eks_cluster" "marketting-dev-markettingeks" {
  name = "markrtting-dev-markettingeks"
}
data "aws_eks_cluster_auth" "marketting-dev-markettingeks_auth" {
  name = "markrtting-dev-markettingeks_auth"
}


provider "aws" {
  region     = "us-east-1"
}
