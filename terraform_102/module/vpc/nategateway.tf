## Private subnet

resource "aws_subnet" "private-subnet-1" {
  vpc_id     = aws_vpc.bakorvpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = false

  tags = {
    Name = "bakor-subnet-1"
  }
}

resource "aws_subnet" "private-subent-2" {
  vpc_id     = aws_vpc.bakorvpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = false

  tags = {
    Name = "bakor-subnet-2"
  }
}

resource "aws_nat_gateway" "bakornat-1" {
  allocation_id = aws_eip.bakoreip-1.id
  subnet_id     = aws_subnet.private-subnet-1.id

  tags = {
    Name = "ivo-nat-1"
  }
}

resource "aws_eip" "bakoreip-1" {
  domain = "bakorvpc"
  depends_on                = [aws_internet_gateway.bakorgw]
}

resource "aws_nat_gateway" "bakornat-2" {
  allocation_id = aws_eip.bakoreip-2.id
  subnet_id     = aws_subnet.private-subent-2.id

  tags = {
    Name = "ivo-nat-2"
  }
}

resource "aws_eip" "bakoreip-2" {
  domain = "bakorvpc"
  depends_on                = [aws_internet_gateway.bakorgw]
}

######### VPC setup for NAT

resource "aws_route_table" "eyongroute-1" {
  vpc_id = aws_vpc.bakorvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.bakornat-1.id
  }
}

resource "aws_route_table" "eyongroute-2" {
  vpc_id = aws_vpc.bakorvpc.id
  route {
    cidr_block = "0.0.0.0/0"
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