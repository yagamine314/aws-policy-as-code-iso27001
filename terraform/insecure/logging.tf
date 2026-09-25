resource "aws_cloudtrail" "main" {
  name           = "${var.project}-trail"
  s3_bucket_name = aws_s3_bucket.audit_logs.id

  is_multi_region_trail        = false
  enable_log_file_validation   = false
  include_global_service_events = true

  tags = {
    Name = "${var.project}-trail"
  }
}

