data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}


data "aws_subnet" "subnet" {
  filter {
    name = "tag:Name"
    values = ["cust_pub_subnet"] # give your subnet name 
  }
}
  

resource "aws_instance" "datasource" {
    ami=data.aws_ami.amzlinux.id
    instance_type = "t2.micro"
    key_name = "harshith"
    #subnet_id = "subnet-0ad2c6d46d5a1da03" #hard coding process but not recomanded
    subnet_id = data.aws_subnet.subnet.id
    
}
