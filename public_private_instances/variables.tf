variable "vpc_id" {
    description = "The VPC ID where the instance will be launched"
    type        = string
    default     = "vpc-0d5530a72b5f38bd9"
}
variable "key_name" {
    default = "/Users/dhruvpatel/.ssh/id_ed25519.pub"
}
