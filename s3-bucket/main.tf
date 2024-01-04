# The default provider configuration; resources that begin with `aws_` will use
# it as the default, and it can be referenced as 'aws'

provider "aws" {
  region = "xxxx" 
}

resource "aws_s3_bucket" "backend" {
  bucket = "three-tier-s3-backend"
}

resource "aws_s3_bucket_ownership_controls" "three_tier_s3_backend_owner" {
  bucket = aws_s3_bucket.backend.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "backend_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.three_tier_s3_backend_owner]

  bucket = aws_s3_bucket.backend.id
  acl    = "private"
}

