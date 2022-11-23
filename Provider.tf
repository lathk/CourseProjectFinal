terraform {

  required_providers {

    aws = {

      source  = "hashicorp/aws"

      version = "4.13.0"

    }

  }

  backend "s3" {

    bucket = "upgrad-lathakcat "

    key = "Tf-statefile/terraform.tfstate"

    region = "us-east-1"

  }
}
