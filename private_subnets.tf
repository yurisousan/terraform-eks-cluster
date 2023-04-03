resource "aws_subnet" "eks_subnet_private_1a" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 3)
  availability_zone = "${data.aws_region.current.name}a"

  tags = merge(
    local.tags,
    {
      Name                              = "${var.project_name}_private_1a",
      "kubernetes.io/role/internal-elb" = 1
    }
  )

}

resource "aws_subnet" "eks_subnet_private_1b" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 4)
  availability_zone = "${data.aws_region.current.name}b"

  tags = merge(
    local.tags,
    {
      Name                              = "${var.project_name}_private_1b",
      "kubernetes.io/role/internal-elb" = 1
    }
  )

}

resource "aws_route_table_association" "eks_priv_rtb_assoc_1a" {
  subnet_id      = aws_subnet.eks_subnet_private_1a
  route_table_id = aws_route_table.eks_priv_rt_1a
}

resource "aws_route_table_association" "eks_priv_rtb_assoc_1b" {
  subnet_id      = aws_subnet.eks_subnet_private_1b
  route_table_id = aws_route_table.eks_priv_rt_1b
}
