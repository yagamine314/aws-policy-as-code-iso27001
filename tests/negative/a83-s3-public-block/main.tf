provider "aws" { region = "eu-west-3" }
resource "aws_s3_bucket_public_access_block" "test" {
  bucket = "ais-public-bad"
  block_public_acls       = false
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = false
}
