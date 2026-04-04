variable "vpc_cidr_block" {
    description = "The CIDR block for the VPC"
    type        = string
}

variable "public_subnet_cidr_block" {
  type        = string
  default     = ""
  description = "The CIDR block for the public subnet"
}

variable "private_subnet_cidr_block" {
  type        = string
  default     = ""
  description = "The CIDR block for the private subnet"
}

variable "vpc_id" {
    description = "The VPC ID where the resources will be created"
    type        = string
}   

