resource "aws_instance" "dependency" {
    ami = "ami-0ec0e125bb6c6e8ec"
    instance_type = "t2.micro"
    key_name = "harshith"
  
}

resource "aws_s3_bucket" "dependent" {
    bucket = "bucket950506"
    depends_on = [ aws_instance.dependency ]
  
}