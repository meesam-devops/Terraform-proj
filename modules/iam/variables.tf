variable "environment" {
  description = "Environment name (dev, staging, production)"
  type        = string
}

variable "ecr_repository_arn" {
  description = "ARN of the ECR repository the CI/CD role may push to"
  type        = string
  default     = "*"
}

variable "eks_cluster_arn" {
  description = "ARN of the EKS cluster the CI/CD role may describe"
  type        = string
  default     = "*"
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}
}
