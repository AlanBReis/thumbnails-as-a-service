resource "aws_instance" "taas_ec2" {
  ami           = "ami-08b5b3a93ed654d19"  # Amazon Linux 2
  instance_type = "t2.micro"              
  subnet_id     = aws_subnet.taas_public_subnet.id
  key_name      = "TaasAWS"          

  iam_instance_profile = aws_iam_instance_profile.taas_ec2_profile.name 

  tags = {
    Name = "TaaS-EC2-Instance"
  }
}
