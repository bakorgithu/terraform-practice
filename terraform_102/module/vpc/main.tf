## VPC

resource "aws_vpc" "bakorvpc" {
cidr_block = var.cidr_block_vpc
instance_tenancy = var.instance_tenancy

tags = {
    name = var.aws_vpc_name
 }
}

##########

resource "aws_subnet" "public-subnet-1" {
  vpc_id     = aws_vpc.bakorvpc.id
  cidr_block = var.cidr_block_pub-subnet-1
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = var.name_pub_subnet-1
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id     = aws_vpc.bakorvpc.id
  cidr_block = var.cidr_block_pub_subnet-2
  availability_zone = "${var.region}b"
   map_public_ip_on_launch = true



  tags = {
    Name = var.name_pub_subnet-2
  }
}

#################
## Internet gateway

resource "aws_internet_gateway" "bakorgw" {
  vpc_id = aws_vpc.bakorvpc.id

  tags = {
    Name = var.name_igw
  }
}

## Route Table

resource "aws_route_table" "bakorroute" {
  vpc_id = aws_vpc.bakorvpc.id

  route {
    cidr_block = var.cidr_block_rtb_pubsubnet
    gateway_id = aws_internet_gateway.bakorgw.id
  }

  tags = {
    Name = var.rtb_name_pubsubnet
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