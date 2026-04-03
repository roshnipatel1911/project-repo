# create vpc

module "vpc" {
    source = "./modules/vpc"
    vpc_id = module.vpc.vpc_id
    vpc_cidr          = var.vpc_cidr

    subnet_id          = module.vpc.public_subnet_id
    subnet_cidr       = var.subnet_cidr

}
# create ec2 instance

module "ec2" {
    source = "./modules/ec2"

    ami_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_id = module.vpc.vpc_id
    subnet_id = module.vpc.public_subnet_id

    tags = {
        Name = "ExampleInstance"
    }
}

