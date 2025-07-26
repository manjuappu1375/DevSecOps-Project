resource "aws_eks_cluster" "netflix" {
  name     = "netflix-eks-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = data.aws_subnets.default.ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster_eks_policy,
    aws_iam_role_policy_attachment.cluster_eks_service_policy
  ]
}

resource "aws_eks_node_group" "netflix_nodes" {
  cluster_name    = aws_eks_cluster.netflix.name
  node_group_name = "netflix-node-group"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = data.aws_subnets.default.ids
  instance_types  = ["t3.medium"]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_worker_policy,
    aws_iam_role_policy_attachment.node_cni_policy,
    aws_iam_role_policy_attachment.node_ecr_readonly
  ]
}
