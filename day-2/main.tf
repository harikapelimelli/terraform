resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name ="cust vpc"
    }
  
}
#create ig and attach to vpc
resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.dev.id
    tags = {
      Name ="cust-ig"
    }
  
}
#creation of public subnet
resource "aws_subnet" "dev" {
  vpc_id = aws_vpc.dev.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name="pub-subnet"
  }
  
}

#creation of private subnet
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.dev.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name ="private-subnet"
  }
  
}
resource "aws_eip" "eip" {
  domain = "vpc"
  tags = {
    Name ="t4-elasticIp"

  }
  
}
#creation of route tables           
 resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id
    tags = {
      Name ="cust-pub-rt"
    }
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.dev.id

    }
 }
 resource "aws_route_table_association" "dev" {
    subnet_id = aws_subnet.dev.id
route_table_id = aws_route_table.dev.id
 }
 
 resource "aws_security_group" "dev" {
   vpc_id = aws_vpc.dev.id
   name = "allow traffic"
   description = "Allow TLS inbound traffic and all outbound traffic"
   tags = {
    Name = "dev-sg"
   }
   ingress {
    description = "TLS from vpc"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

   }
ingress {
    description = "TLS from vpc"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

   }
   egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

   }
 }
 #creation of NAT-Gateway
 resource "aws_nat_gateway" "private" {
  allocation_id = aws_eip.eip.id
  subnet_id = aws_subnet.dev.id
  tags = {
    Name ="nat-gateway"
  }
   
 }
 #creation of route_table to connect to private subnet to nat
 resource "aws_route_table" "private" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.private.id
  }
  tags = {
    Name="private-route"
   
 }
 }
 #association of routetable to privatesubet
 resource "aws_route_table_association" "private" {
  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.private.id

   
 }
