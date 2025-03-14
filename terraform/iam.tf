resource "aws_iam_role" "taas_ec2_role" {
  name = "TaaS-EC2-Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Effect    = "Allow"
      Sid       = ""
    }]
  })
}

resource "aws_iam_policy" "taas_s3_policy" {
  name   = "TaaS-S3-Policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action   = ["s3:ListBucket", "s3:PutObject", "s3:GetObject"]
      Resource = [
        aws_s3_bucket.taas_bucket.arn,
        "${aws_s3_bucket.taas_bucket.arn}/*"
      ]
      Effect   = "Allow"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "taas_ec2_policy_attachment" {
  policy_arn = aws_iam_policy.taas_s3_policy.arn
  role       = aws_iam_role.taas_ec2_role.name
}

resource "aws_iam_instance_profile" "taas_ec2_profile" {
  name = "TaaS-EC2-Instance-Profile"
  role = aws_iam_role.taas_ec2_role.name
}
