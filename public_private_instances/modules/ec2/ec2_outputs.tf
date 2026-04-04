output "insta1_public_ip" {
    value = aws_instance.insta1.public_ip
}

output "insta2_private_ip" {
    value = aws_instance.insta2.private_ip
}
