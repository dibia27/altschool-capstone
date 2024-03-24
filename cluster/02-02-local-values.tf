locals {
  owners           = var.team
  environment      = var.environment
  name             = "${var.team}-${var.environment}"
  eks_cluster_name = "${local.name}-${var.cluster_name}"

  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
}