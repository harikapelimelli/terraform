# Provider-1 for us-east-1 (Default Provider)
provider "aws" {
  region = "ap-south-1"
  
}

#Another provider alias 
provider "aws" {
  region = "us-east-1"
  alias = "america"
}
provider "aws" {
  region = "us-east-2"
  alias = "africa"
}

resource "aws_s3_bucket" "test" {
  bucket = "bucket11111111111111796"

}
resource "aws_s3_bucket" "test2" {
  bucket = "bucket222222222222222"
  provider = aws.africa  #provider.value of alias
  
}
resource "aws_s3_bucket" "test3" {
  bucket = "bucket3333333333333"
  provider = aws.america  #provider.value of alias
  
}