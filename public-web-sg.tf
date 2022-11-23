//security.tf
resource "aws_security_group" "public_web_sg" {
  name        = "public-web-sg"
  description = "Allow SSH inbound traffic to bastion host"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "Web"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-web-sg"
  }
}