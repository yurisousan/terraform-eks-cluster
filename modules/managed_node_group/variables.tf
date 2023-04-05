variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources (Name tag)"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
}

variable "cluster_name" {
  type        = string
  description = "EKS Cluster name for create MNG"
}

variable "private_subnet_1a" {
  type        = string
  description = "Private subnet from VPC"
}

variable "private_subnet_1b" {
  type        = string
  description = "Private subnet from VPC"
}
