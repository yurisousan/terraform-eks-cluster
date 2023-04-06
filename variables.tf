variable "cidr_block" {
  type        = string
  description = "CIDR defined for create VPC"
}

variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources (Name tag)"
}

variable "region" {
  type        = string
  description = "AWS region to create resources"
}

variable "tags" {
  type        = map(any)
  description = "A map of tags to tag AWS resources"
}
