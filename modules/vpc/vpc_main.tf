# create vpc

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

}

resource "aws_subnet" "main" {
  vpc_id     = var.vpc_id
  map_public_ip_on_launch = true
  cidr_block = var.subnet_cidr
}

resource "aws_internet_gateway" "main" {
  vpc_id = var.vpc_id
}

resource "aws_route_table" "main" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}


