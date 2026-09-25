resource "aws_s3_bucket" "customer_data" {
  bucket = "ais-customer-data-${var.bucket_suffix}"

  tags = {
    Name             = "${var.project}-customer-data"
    DataClassification = "Confidential"
  }
}

resource "aws_s3_bucket" "audit_logs" {
  bucket = "ais-audit-logs-${var.bucket_suffix}"

  tags = {
    Name = "${var.project}-audit-logs"
  }
}

resource "aws_s3_bucket_public_access_block" "customer_data" {
  bucket = aws_s3_bucket.customer_data.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
