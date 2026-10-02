terraform {
  required_version = ">= 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

locals {
  environment = "dev"
  common_tags = {
    Environment = local.environment
    ManagedBy   = "terraform"
    Project     = "infra-portfolio"
  }
}

module "vpc" {
  source = "../../modules/vpc"

  environment           = local.environment
  vpc_cidr               = var.vpc_cidr
  public_subnet_cidrs    = var.public_subnet_cidrs
  private_subnet_cidrs   = var.private_subnet_cidrs
  tags                   = local.common_tags
}

module "iam" {
  source = "../../modules/iam"

  environment = local.environment
  tags        = local.common_tags
}

module "eks" {
  source = "../../modules/eks"

  environment          = local.environment
  cluster_role_arn     = module.iam.eks_cluster_role_arn
  node_role_arn        = module.iam.eks_node_role_arn
  public_subnet_ids    = module.vpc.public_subnet_ids
  private_subnet_ids   = module.vpc.private_subnet_ids
  desired_node_count   = var.desired_node_count
  min_node_count       = var.min_node_count
  max_node_count       = var.max_node_count
  node_instance_types  = var.node_instance_types
  tags                 = local.common_tags
}

# Example: referencing a secret at apply time instead of hardcoding it
data "aws_secretsmanager_secret_version" "db_credentials" {
  secret_id = "production/app/db-credentials"
}
