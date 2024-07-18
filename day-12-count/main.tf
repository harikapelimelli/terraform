resource "aws_instance" "name" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key
  associate_public_ip_address = true
  count = length(var.phillips)
  #tags = {
   # Name = "web-${count.index}"
  #}
tags = {
  Name = var.phillips[count.index]
}

  
}
variable "phillips" {
    type = list(string)
    default = [ "dev", "test", "prod" ]

  
}