resource "aws_instance" "dev" {
    ami = "ami-01376101673c89611"
    instance_type = "t2.micro"
    key_name = "harshith"
    vpc_security_group_ids = [aws_security_group.dev.id]
    subnet_id = aws_subnet.dev.id
    associate_public_ip_address = true
    tags = {
      Name ="dev-pub"
    }
}

  #creation of private-ec2 instance
resource "aws_instance" "private-ec2" {
  ami= "ami-01376101673c89611"
  instance_type = "t2.micro"
  key_name = "harshith"
  subnet_id = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.dev.id]
  tags = {
    Name ="private-ec2"
  }
  
}