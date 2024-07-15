resource "aws_instance" "example" {
    ami = "ami-0ec0e125bb6c6e8ec"
  instance_type = "t2.micro"
  key_name = "harshith"
  tags = {
    Name = "ec2-pub"

  }
}
