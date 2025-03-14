resource "aws_s3_bucket" "taas_bucket" {
  bucket = "taas-images-bucket-${random_string.bucket_suffix.result}"

  tags = {
    Name = "TaaS-Images-Bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "taas_bucket_public_block" {
  bucket = aws_s3_bucket.taas_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "random_string" "bucket_suffix" {
  length  = 8
  upper   = false
  numeric = true  
  special = false
}
