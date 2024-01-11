output "xpanse_main" {
  value = aws_vpc.xpanse_main.id
}

output "Public_subnets" {
  value = [
    aws_subnet.xpanse_public1.id,
    aws_subnet.xpanse_public2.id
  ]
}

output "Private_subnets" {
  value = [
    aws_subnet.xpanse_private1.id,
    aws_subnet.xpanse_private2.id
  ]
}