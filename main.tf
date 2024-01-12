terraform {
  backend "local" {
   # region         = "us-east-1"
   # dynamodb_table = "terraform-up-and-running-locks"
    #key            = "tf-state/terraform.tfstate"
   # bucket         = "cc-tf-remote-backend"
   # encrypt        = true
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "tf-state" {
  source      = "./modules/tf-state"
  bucket_name = "cc-tf-remote-backend"
}

module "infra_vpc" {
  source = "./modules/vpc"

  vpc_cidr             = local.vpc_cidr
  availability_zones   = local.availability_zones
  public_subnet_cidrs  = local.public_subnet_cidrs
  private_subnet_cidrs = local.private_subnet_cidrs

}