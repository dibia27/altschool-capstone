variable "aws_region" {
  description = "Region in which AWS Resources are going to be created"
  type        = string
}

variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
}

variable "team" {
  description = "Inicates which team is working on the cluster"
  type        = string
}