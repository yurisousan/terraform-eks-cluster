module "eks_network" {
  source       = "./modules/network"
  vpc_cidr     = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}

module "eks_cluster" {
  source           = "./modules/cluster"
  project_name     = var.project_name
  tags             = local.tags
  public_subnet_1a = module.eks_network.subnet_pub_1a
  public_subnet_1b = module.eks_network.subnet_pub_1b
}

module "eks_managed_node_group" {
  source            = "./modules/managed_node_group"
  project_name      = var.project_name
  cluster_name      = module.eks_cluster.cluster_name
  tags              = local.tags
  private_subnet_1a = module.eks_network.subnet_priv_1a
  private_subnet_1b = module.eks_network.subnet_priv_1b
}

module "eks_aws_lb_controller" {
  source       = "./modules/aws-load-balancer-controller"
  project_name = var.project_name
  tags         = local.tags
  oidc         = module.eks_cluster.oidc
  cluster_name = module.eks_cluster.cluster_name
}
