module "eks_network" {
  source       = "./modules/network"
  vpc_cidr     = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}
