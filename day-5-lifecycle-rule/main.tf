resource "aws_instance" "dev" {
    instance_type = "t2.micro"
    ami = "ami-0ec0e125bb6c6e8ec"

    key_name = "harshith"
   availability_zone = "ap-south-1a"
    tags = {
      Name = "day-5"
    }


  lifecycle {
    
    create_before_destroy = true
 }
  #lifecycle {
  #  prevent_destroy = true
#  }
 #lifecycle {
  #}
}