resource "aws_vpc" "taas_vpc" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "TaaS-VPC"
  }
}

resource "aws_subnet" "taas_public_subnet" {
  vpc_id                  = aws_vpc.taas_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true  

  tags = {
    Name = "TaaS-Public-Subnet"
  }
}

resource "aws_subnet" "taas_private_subnet" {
  vpc_id            = aws_vpc.taas_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "TaaS-Private-Subnet"
  }
}

resource "aws_internet_gateway" "taas_igw" {
  vpc_id = aws_vpc.taas_vpc.id

  tags = {
    Name = "TaaS-Internet-Gateway"
  }
}

resource "aws_route_table" "taas_public_rt" {
  vpc_id = aws_vpc.taas_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.taas_igw.id
  }

  tags = {
    Name = "TaaS-Public-Route-Table"
  }
}

resource "aws_route_table_association" "taas_public_assoc" {
  subnet_id      = aws_subnet.taas_public_subnet.id
  route_table_id = aws_route_table.taas_public_rt.id
}
