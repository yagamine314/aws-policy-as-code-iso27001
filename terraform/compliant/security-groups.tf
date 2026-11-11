resource "aws_security_group" "public" {
  name        = "${var.project}-public-sg"
  description = "Security group for the public zone entry component"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH open to the entire internet - DEMO: intentional violation for the CI gate"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-public-sg"
    Zone = "public"
  }
}

resource "aws_security_group" "application" {
  name        = "${var.project}-app-sg"
  description = "Security group for the application zone"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Allow traffic only from the public zone security group"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.public.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-app-sg"
    Zone = "application"
  }
}
