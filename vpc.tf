# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  # VPC Basic Details
  name = "vpc"
  cidr = "10.0.0.0/16"   
  azs                 = ["us-east-1a", "us-east-1b"]
  private_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets      = ["10.0.11.0/24", "10.0.12.0/24"]


  # NAT Gateways - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true
  enable_vpn_gateway = false

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  tags = {
    Owner = "suraj"
    Terraform = "true"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc"
  }

}