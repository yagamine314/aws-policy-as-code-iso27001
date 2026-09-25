data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "application" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.application.id
  vpc_security_group_ids = [aws_security_group.application.id]
  iam_instance_profile   = aws_iam_instance_profile.application.name

  tags = {
    Name = "${var.project}-app-server"
    Zone = "application"
  }
}
