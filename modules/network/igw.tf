resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}_igw"
    }
  )
}

resource "aws_route_table" "eks_pub_rt" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}_public_rtb"
    }
  )

}
