provider "aws" {
  region = "us-east-1"  
}

resource "aws_vpc" "taas_vpc" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "TaaS-VPC"
  }
}

resource "aws_subnet" "taas_public_subnet" {
  vpc_id            = aws_vpc.taas_vpc.id
  cidr_block        = "10.0.1.0/24"  # CIDR da subnet pública
  availability_zone = "us-east-1a"    

  tags = {
    Name = "TaaS-Public-Subnet"
  }
}

resource "aws_subnet" "taas_private_subnet" {
  vpc_id            = aws_vpc.taas_vpc.id
  cidr_block        = "10.0.2.0/24"  # CIDR da subnet privada
  availability_zone = "us-east-1a"   

  tags = {
    Name = "TaaS-Private-Subnet"
  }
}

resource "aws_instance" "taas_ec2" {
  ami           = "ami-08b5b3a93ed654d19"  # AMI para Amazon Linux
  instance_type = "t2.micro"              
  subnet_id     = aws_subnet.taas_public_subnet.id
  key_name      = "TaasAWS"          

  tags = {
    Name = "TaaS-EC2-Instance"
  }
}
