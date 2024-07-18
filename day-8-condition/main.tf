variable "aws_region" {
  description = "The region in which to create the infrastructure"
  type        = string
  nullable    = false
  default     = "ap-south-1" #here we need to define either ap-south-1 or us-east-1 if i give other region will get error 
  validation {
    condition = var.aws_region == "ap-south-1" || var.aws_region == "us-east-1"
    error_message = "The variable 'aws_region' must be one of the following regions: ap-south-1, us-east-1"
  }
}

provider "aws" {
  region = "ap-south-1"
  
   
 }

 resource "aws_s3_bucket" "dev" {
    bucket = "bucketttt9505"
    
  
}

#after run this will get error like The variable 'aws_region' must be one of the following regions: us-west-2,│ eu-west-1, so it will allow any one region defined above in conditin block