resource "aws_iam_role" "application" {
  name = "AISApplicationRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "${var.project}-app-role"
  }
}

resource "aws_iam_role_policy" "application_permissive" {
  name = "AISApplicationPolicy-Permissive"
  role = aws_iam_role.application.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "*"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "application" {
  name = "${var.project}-app-instance-profile"
  role = aws_iam_role.application.name
}

