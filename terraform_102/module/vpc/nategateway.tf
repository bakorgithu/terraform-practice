## Private subnet

resource "aws_subnet" "private-subnet-1" {
  vpc_id     = aws_vpc.bakorvpc.id
  cidr_block = var.cidr_block_priv_subnet-1
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = false

  tags = {
    Name = var.name_priv_subnet-1
  }
}

resource "aws_subnet" "private-subent-2" {
  vpc_id     = aws_vpc.bakorvpc.id
  cidr_block = var.cidr_block_priv_subnet-2
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = false

  tags = {
    Name = var.name_priv_subnet-2
  }
}

resource "aws_nat_gateway" "bakornat-1" {
  allocation_id = aws_eip.bakoreip-1.id
  subnet_id     = aws_subnet.private-subnet-1.id

  tags = {
    Name = var.nat_gateway_1_name
  }
}

resource "aws_eip" "bakoreip-1" {
  domain = "vpc"
  depends_on                = [aws_internet_gateway.bakorgw]
}

resource "aws_nat_gateway" "bakornat-2" {
  allocation_id = aws_eip.bakoreip-2.id
  subnet_id     = aws_subnet.private-subent-2.id

  tags = {
    Name = var.nat_gateway_2_name
  }
}

resource "aws_eip" "bakoreip-2" {
  domain = "vpc"
  depends_on                = [aws_internet_gateway.bakorgw]
}

######### VPC setup for NAT

resource "aws_route_table" "eyongroute-1" {
  vpc_id = aws_vpc.bakorvpc.id
  route {
    cidr_block = var.cidr_block_rtb1_privsubnet
    nat_gateway_id = aws_nat_gateway.bakornat-1.id
  }
}

resource "aws_route_table" "eyongroute-2" {
  vpc_id = aws_vpc.bakorvpc.id
  route {
    cidr_block = var.cidr_block_rtb2_privsubnet
    nat_gateway_id = aws_nat_gateway.bakornat-2.id
  }
}

resource "aws_route_table_association" "private-1" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.eyongroute-1.id
}

resource "aws_route_table_association" "private-2" {
  subnet_id = aws_subnet.private-subent-2.id
  route_table_id = aws_route_table.eyongroute-2.id
}