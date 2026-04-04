# output vpc id and subnet id
output "vpc_id" {
    value = aws_vpc.vpc1.id
}   
output "public_subnet_id" {
    value = aws_subnet.public_subnet1.id
}  

output "private_subnet_id" {
    value = aws_subnet.private_subnet2.id
}

