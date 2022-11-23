module "ec2_instance_jenkins" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "Jenkins"

  ami                    = "ami-0149b2da6ceec4bb0"
  instance_type          = "t2.micro"
  key_name               = "Ansible"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.private_instances_sg.id]
  subnet_id              = module.vpc.private_subnets[0]
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
