resource "aws_vpc" "test-vpc" {
  cidr_block = var.vpc_cidr
  tags = {

    default= "test-vpc"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.test-vpc.id
  cidr_block = var.sub1cidr
  map_public_ip_on_launch = true
  availability_zone = "ap-northeast-1c"
  tags = {

    default= "subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id = aws_vpc.test-vpc.id
  cidr_block = var.sub2cidr
  map_public_ip_on_launch = true
  availability_zone = "ap-northeast-1d"
  tags = {

    default= "subnet2"
  }
}

resource "aws_internet_gateway" "test-igw" {

  vpc_id = aws_vpc.test-vpc.id


  tags = {

    default= "test-igw"
  }
}

resource "aws_default_route_table" "test-rt" {
  # vpc_id = aws_vpc.test-vpc.id
  default_route_table_id = aws_vpc.test-vpc.default_route_table_id
  tags = {

    default= "route1"
  }
  route {
    cidr_block = var.route1
    gateway_id = aws_internet_gateway.test-igw.id

  }
}

resource "aws_route_table_association" "rt1" {
  route_table_id = aws_default_route_table.test-rt.id
  subnet_id = aws_subnet.subnet1.id

}


resource "aws_route_table_association" "rt2" {
  route_table_id = aws_default_route_table.test-rt.id
  subnet_id = aws_subnet.subnet2.id

}