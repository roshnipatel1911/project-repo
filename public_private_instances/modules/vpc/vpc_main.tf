# create vpc

resource "aws_vpc" "vpc1" {
    cidr_block = var.vpc_cidr_block
}

# create subnets
resource "aws_subnet" "public_subnet1" {
    vpc_id = aws_vpc.vpc1.id
    map_public_ip_on_launch = true
    cidr_block = var.public_subnet_cidr_block
}

resource "aws_subnet" "private_subnet2" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.private_subnet_cidr_block
}

# create public route table

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.vpc1.id
}

# associate rt with subnet
resource "aws_route_table_association" "rta1" {
    subnet_id = aws_subnet.public_subnet1.id
    route_table_id = aws_route_table.public_rt.id
}

# create igw
resource "aws_internet_gateway" "igw1" {
    vpc_id = aws_vpc.vpc1.id
}

# create route to igw
resource "aws_route" "route1" {
    route_table_id = aws_route_table.public_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1.id
}