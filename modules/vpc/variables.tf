variable "vpc_cidr" {
  type        = string
  default     = "172.0.0.0/16"
  description = "CIDR for VPC"
}

variable "availability_zones" {
  type        = list(string)
  description = "AZ for Subnets"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDRs for Public Subnets"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDRs for Private Subnets"
}