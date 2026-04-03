resource "aws_security_group" "main" {
  name        = "main_security_group"
  description = "Allow SSH and HTTP"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
}

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
}

}

resource "aws_instance" "web1" {
    ami = var.ami_id
    instance_type = var.instance_type
    security_groups = [aws_security_group.main.name]
    subnet_id = var.subnet_id
    associate_public_ip_address = true

}

