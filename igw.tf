resource "aws_internet_gateway" "eks_igw" {
  vpc_id = var.vpc_cidr
  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}_igw"
    }
  )
}

resource "aws_route_table" "eks_pub_rt" {
  vpc_id = var.vpc_cidr

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw
  }

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}_public_rtb"
    }
  )

}
