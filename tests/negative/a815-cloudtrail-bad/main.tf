provider "aws" { region = "eu-west-3" }
resource "aws_s3_bucket" "trail" { bucket = "ais-trail-bad" }
resource "aws_cloudtrail" "bad" {
  name                          = "bad-trail"
  s3_bucket_name                = aws_s3_bucket.trail.id
  is_multi_region_trail         = false
  enable_log_file_validation    = false
}
