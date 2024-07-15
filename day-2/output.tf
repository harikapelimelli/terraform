output "ec2-public-ip" {
    value = aws_instance.dev.public_ip
    description = "print the value of public ip"

  
}
output "private_ip" {
    value = aws_instance.private-ec2.private_ip
    description = "print the value of private ip"
    sensitive = true
  
}