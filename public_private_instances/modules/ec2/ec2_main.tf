# crate security group

resource "aws_security_group" "sg1" {
    name = "sg1"
    description = "Allow SSH and HTTP traffic"
    vpc_id = var.vpc_id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]     
    }
    ingress {
        from_port = 80        
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]     
    }   

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]     
    }
}


# create public ec2 instance

resource "aws_instance" "insta1" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.sg1.id]
    subnet_id = var.public_subnet_id
    key_name = var.key_name

    tags = var.tags
}

# create private ec2 instance
resource "aws_instance" "insta2" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.sg1.id]
    subnet_id = var.private_subnet_id
}