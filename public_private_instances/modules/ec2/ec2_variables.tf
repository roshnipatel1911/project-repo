variable "ami" {
    description = "The AMI to use for the instance"
    type        = string
}

variable "instance_type" {
    description = "The type of instance to start"
    type        = string
}

variable "vpc_id" {
    description = "The VPC ID where the instance will be launched"
    type        = string
}

variable "public_subnet_id" {
    description = "The Subnet ID where the instance will be launched"
    type        = string
}

variable "private_subnet_id" {
    description = "The Subnet ID where the instance will be launched"
    type        = string
}

variable "key_name" {
    description = "The name of the key pair to use for SSH access"
    type        = string
}

variable "tags" {
  type        = map(string)
  description = "Tags for the EC2 instance"
}
