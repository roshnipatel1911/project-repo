variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "subnet_cidr" {
    default = "10.0.1.0/24"
}

variable "ami_id" {
    default = "ami-0ec10929233384c7f"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "key_name" {
    default = "roshni_key"
}