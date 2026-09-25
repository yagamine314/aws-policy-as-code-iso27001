provider "aws" { region = "eu-west-3" }
resource "aws_s3_bucket" "confidential" {
  bucket = "ais-confidential-bad"
  tags   = { DataClassification = "Confidential" }
}
