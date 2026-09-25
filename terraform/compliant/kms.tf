resource "aws_kms_key" "customer_data" {
  description             = "KMS key for AIS customer data - approved organizational key per AIS baseline"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = {
    Name = "${var.project}-customer-data-key"
  }
}

resource "aws_kms_alias" "customer_data" {
  name          = "alias/${var.project}-customer-data"
  target_key_id = aws_kms_key.customer_data.key_id
}
