variable "ami_id" {
    type = string
  default = "ami-0ec0e125bb6c6e8ec"
  description = "passing ami value to main "
}

variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "passing the values of instance type "
  
}

variable "key" {
    type = string
    default = "harshith"
    description = "passing the values of key"
  
}
variable "phillips" {
    type = list(string)
    default = [ "dev", "test", ]
  
}