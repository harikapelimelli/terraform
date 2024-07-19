resource "aws_instance" "phillips" {
  ami           = var.ami_id
  instance_type = var.instance_type
  for_each      = toset(var.phillips)
  key_name = var.key
#   count = length(var.sandboxes)
  tags = {
    Name = each.value # for a set, each.value and each.key is the same
  }
}