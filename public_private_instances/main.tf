#create ec2 instance with security group

provider "aws" {
    region = "us-east-1"
}


module "vpc" {
    source = "./modules/vpc"
    vpc_id = var.vpc_id
    vpc_cidr_block = "10.0.0.0/16"
    public_subnet_cidr_block = "10.0.1.0/24"
    private_subnet_cidr_block = "10.0.2.0/24"
}

module "ec2" {
    source = "./modules/ec2"
    vpc_id = module.vpc.vpc_id
    public_subnet_id = module.vpc.public_subnet_id
    private_subnet_id = module.vpc.private_subnet_id
    ami = "ami-0c94855ba95c71c99"
    instance_type = "t2.micro"
    key_name = var.key_name 

    tags = {
        Name = "Public-Private-Instances"               
    }
}
