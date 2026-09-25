terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}
provider "aws" { region = "eu-west-3" }

resource "aws_s3_bucket" "app" {
  bucket = "ais-app-data"
  tags = { Name = "test-app" }
}
