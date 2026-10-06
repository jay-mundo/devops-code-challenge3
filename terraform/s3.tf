resource "aws_s3_bucket" "challenge" {
  bucket_prefix = "devops-code-challenge3-"

  tags = {
    Name = "devops-code-challenge3-bucket"
  }
}