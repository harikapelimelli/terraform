module "test" {
    source = "../day-1"
    ami_id = "ami-0ec0e125bb6c6e8ec"
instance_type = "t2.micro"
key = "harshith"

  
}