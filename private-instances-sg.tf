//security.tf
resource "aws_security_group" "private_instances_sg" {
  name        = "private-instances-sg"
  description = "Allow all inbound traffic from within the VPC"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "All traffic from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["10.0.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-instances-sg"
  }
}