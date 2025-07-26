output "eks_cluster_name" {
  description = "EKS Cluster Name"
  value       = aws_eks_cluster.netflix.name
}

output "eks_nodegroup_name" {
  description = "EKS Node Group Name"
  value       = aws_eks_node_group.netflix_nodes.node_group_name
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster API Server Endpoint"
  value       = aws_eks_cluster.netflix.endpoint
}

output "eks_cluster_arn" {
  description = "EKS Cluster ARN"
  value       = aws_eks_cluster.netflix.arn
}

output "eks_kubeconfig_command" {
  description = "Command to set up kubectl config for this EKS cluster"
  value       = "aws eks --region us-east-1 update-kubeconfig --name ${aws_eks_cluster.netflix.name}"
}