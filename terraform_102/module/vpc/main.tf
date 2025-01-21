## VPC

resource "aws_vpc" "bakorvpc" {
cidr_block = "10.0.0.0/8"
instance_tenancy = "default"

tags = {
    name = "ivo-vpc"
 }
}

##########

resource "aws_subnet" "public-subnet-1" {
  vpc_id     = aws_vpc.bakorvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "ivo-subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id     = aws_vpc.bakorvpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "${var.region}b"
   map_public_ip_on_launch = true



  tags = {
    Name = "ivo-subnet-2"
  }
}

#################
## Internet gateway

resource "aws_internet_gateway" "bakorgw" {
  vpc_id = aws_vpc.bakorvpc.id

  tags = {
    Name = "ivo-gateway"
  }
}

## Route Table

resource "aws_route_table" "bakorroute" {
  vpc_id = aws_vpc.bakorvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bakorgw.id
  }

  
  tags = {
    Name = "ivo-routetable"
  }
}

#################
## Route Table Association

resource "aws_route_table_association" "public-1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.bakorroute.id
}

resource "aws_route_table_association" "public-2" {
  subnet_id = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.bakorroute.id
}

#################
##########################################