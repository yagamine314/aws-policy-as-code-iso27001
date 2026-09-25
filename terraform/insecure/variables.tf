variable "aws_region" {
  description = "AWS region where the lab infrastructure is deployed"
  type        = string
  default     = "eu-west-3"
}

variable "project" {
  description = "Project tag applied to all resources, used for cost tracking and scoping"
  type        = string
  default     = "AIS-PFA"
}

variable "environment" {
  description = "Environment label for this deployment (insecure or compliant state)"
  type        = string
  default     = "insecure"
}

variable "bucket_suffix" {
  description = "Suffix appended to S3 bucket names to ensure global uniqueness"
  type        = string
}

