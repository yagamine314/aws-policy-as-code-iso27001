terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}
provider "aws" {
  region = "eu-west-3"
}

resource "aws_security_group" "public" {
  name        = "negative-ssh-open"
  description = "SSH open to 0.0.0.0/0 — A.8.20 violation"
  vpc_id      = "vpc-12345678"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
