module "test" {
    source = "github.com/harikapelimelli/terraform/day-1-basic-instance"
    ami_id = "ami-0ec0e125bb6c6e8ec"
instance_type = "t2.micro"
key = "harshith"
}