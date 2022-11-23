module "ec2_instance_bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "bastion"

  ami                    = "ami-0149b2da6ceec4bb0"
  instance_type          = "t2.micro"
  key_name               = "Ansible"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.bastion_host_sg.id]
  subnet_id              = module.vpc.public_subnets[0]
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}