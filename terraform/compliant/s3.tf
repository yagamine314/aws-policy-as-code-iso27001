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

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "customer_data" {
  bucket = aws_s3_bucket.customer_data.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.customer_data.arn
    }
    bucket_key_enabled = true
  }
}
