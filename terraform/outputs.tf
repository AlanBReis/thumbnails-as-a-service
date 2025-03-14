output "vpc_id" {
  value = aws_vpc.taas_vpc.id
}

output "ec2_public_ip" {
  value = aws_instance.taas_ec2.public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.taas_bucket.bucket
}
