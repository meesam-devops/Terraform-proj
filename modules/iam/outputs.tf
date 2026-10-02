output "eks_cluster_role_arn" {
  description = "ARN of the EKS cluster IAM role"
  value       = aws_iam_role.eks_cluster.arn
}

output "eks_node_role_arn" {
  description = "ARN of the EKS node IAM role"
  value       = aws_iam_role.eks_node.arn
}

output "cicd_execution_role_arn" {
  description = "ARN of the CI/CD execution IAM role"
  value       = aws_iam_role.cicd_execution.arn
}
