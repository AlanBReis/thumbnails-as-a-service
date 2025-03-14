variable "aws_region" {
  description = "Região da AWS"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI da EC2"
  default     = "ami-08b5b3a93ed654d19"
}
