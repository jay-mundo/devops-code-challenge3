variable "admin_cidr" {
  description = "Public IP address allowed to SSH into the EC2 instance"
  type        = string
}

resource "aws_security_group" "ec2" {
  name        = "devops-code-challenge3-ec2-sg"
  description = "Security group for Challenge 3 EC2 instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from administrator"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  ingress {
    description = "HTTP from the internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops-code-challenge3-ec2-sg"
  }
}