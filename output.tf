output "oidc" {
  value = module.eks_cluster.oidc
}

output "cluster_ca_certificate" {
  value = module.eks_cluster.cluster_ca_certificate[0].data
}

output "cluster_endpoint" {
  value = module.eks_cluster.cluster_endpoint
}
