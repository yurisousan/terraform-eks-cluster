resource "aws_eip" "eks_ngw_eip_1a" {
  vpc = true

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}_eip_1a"
    }
  )

}

resource "aws_eip" "eks_ngw_eip_1b" {
  vpc = true
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}_eip_1b"
    }
  )
}

resource "aws_nat_gateway" "eks_ngw_1a" {
  allocation_id = aws_eip.eks_ngw_eip_1a.id
  subnet_id     = aws_subnet.eks_subnet_public_1a.id
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}_ngw_1a"
    }
  )
  depends_on = [
    aws_internet_gateway.eks_igw
  ]
}

resource "aws_nat_gateway" "eks_ngw_1b" {
  allocation_id = aws_eip.eks_ngw_eip_1b.id
  subnet_id     = aws_subnet.eks_subnet_public_1b.id
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}_ngw_1b"
    }
  )
  depends_on = [
    aws_internet_gateway.eks_igw
  ]
}

resource "aws_route_table" "eks_priv_rt_1a" {
  vpc_id = var.vpc_cidr

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_1a.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}_private_rtb_1a"
    }
  )

}

resource "aws_route_table" "eks_priv_rt_1b" {
  vpc_id = var.vpc_cidr

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_ngw_1b.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}_private_rtb_1b"
    }
  )

}
