resource "aws_instance" "dependency" {
    ami = "ami-0ec0e125bb6c6e8ec"
    instance_type = "t2.micro"
    key_name = "harshith"
  user_data = file("script.sh")
  tags = {
    Name = "userdata"
  }
}
