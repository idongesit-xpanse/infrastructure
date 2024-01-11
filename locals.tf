locals {
  vpc_cidr             = "172.0.0.0/16"
  availability_zones   = ["us-east-1a", "us-east-1b"]
  public_subnet_cidrs  = ["172.0.0.0/19", "172.0.32.0/19"]
  private_subnet_cidrs = ["172.0.64.0/19", "172.0.96.0/19"]
}

    