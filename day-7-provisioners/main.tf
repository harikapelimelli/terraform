# Define the AWS provider configuration.
provider "aws" {
  region = "ap-south-1"  # Replace with your desired AWS region.
}


resource "aws_key_pair" "dev" {
  key_name   = "task"  # Replace with your desired key name
  public_key = file("/Users/shivakumarkotha/.ssh/id_ed25519.pub") #creating key resource with public key

}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "internet" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "routetable1" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet.id
  }
}

resource "aws_route_table_association" "association" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.routetable1.id
}

resource "aws_security_group" "sg" {
  name   = "web"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-sg"
  }
}

resource "aws_instance" "provisioner" {
  ami                    = "ami-0ec0e125bb6c6e8ec"
  instance_type          = "t2.micro"
  key_name      = aws_key_pair.dev.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id              = aws_subnet.subnet1.id

  connection {
    type        = "ssh"
    user        = "ubuntu"  # Replace with the appropriate username for your EC2 instance
    # private_key = file("/Users/shivakumarkotha/.ssh/id_ed25519")
    private_key = file("/Users/shivakumarkotha/.ssh/id_ed25519")  #private key path
    host        = self.public_ip
  }
  # local execution procee 
 provisioner "local-exec" {
    command = "touch file100"
   
 }
  # File provisioner to copy a file from local to the remote EC2 instance
  provisioner "file" {
    source      = "file10"  # Replace with the path to your local file
    destination = "/home/ubuntu/file10"  # Replace with the path on the remote instance
  }
  # remote execution process 
  provisioner "remote-exec" {
    inline = [
"touch file400",
"echo hello from aws >> file400",
]
 }
}

 