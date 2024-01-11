resource "aws_vpc" "xpanse_main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name    = "xpanse_main"
    Project = "Architecture Design"
  }
}

#Subnets

resource "aws_subnet" "xpanse_public1" {
  vpc_id            = aws_vpc.xpanse_main.id
  availability_zone = var.availability_zones[0]
  cidr_block        = var.public_subnet_cidrs[0]

  tags = {
    Name    = "Xpanse_public_subnet1"
    Project = "Architecture Design"
  }
}

resource "aws_subnet" "xpanse_public2" {
  vpc_id            = aws_vpc.xpanse_main.id
  availability_zone = var.availability_zones[1]
  cidr_block        = var.public_subnet_cidrs[1]

  tags = {
    Name    = "Xpanse_public_subnet2"
    Project = "Architecture Design"
  }
}

resource "aws_subnet" "xpanse_private1" {
  vpc_id            = aws_vpc.xpanse_main.id
  availability_zone = var.availability_zones[0]
  cidr_block        = var.private_subnet_cidrs[0]

  tags = {
    Name    = "Xpanse_private_subnet1"
    Project = "Architecture Design"
  }
}

resource "aws_subnet" "xpanse_private2" {
  vpc_id            = aws_vpc.xpanse_main.id
  availability_zone = var.availability_zones[1]
  cidr_block        = var.private_subnet_cidrs[1]

  tags = {
    Name    = "Xpanse_private_subnet2"
    Project = "Architecture Design"
  }
}

#Route tables

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.xpanse_main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.xpanse_igw.id
  }

  tags = {
    Name    = "Public Route Table"
    Project = "Architecture Design"
  }
}
resource "aws_route_table" "private_rt1" {
  vpc_id = aws_vpc.xpanse_main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.Natgateway1.id
  }

  tags = {
    Name    = "Private Route Table1"
    Project = "Architecture Design"
  }
}

resource "aws_route_table" "private_rt2" {
  vpc_id = aws_vpc.xpanse_main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.Natgateway2.id
  }

  tags = {
    Name    = "Private Route Table2"
    Project = "Architecture Design"
  }
}

#Route Table Association

resource "aws_route_table_association" "public_subnet_1" {
  subnet_id      = aws_subnet.xpanse_public1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_2" {
  subnet_id      = aws_subnet.xpanse_public2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_subnet_1" {
  subnet_id      = aws_subnet.xpanse_private1.id
  route_table_id = aws_route_table.private_rt1.id
}

resource "aws_route_table_association" "private_subnet_2" {
  subnet_id      = aws_subnet.xpanse_private2.id
  route_table_id = aws_route_table.private_rt2.id
}


#NATGateways

resource "aws_eip" "NatgatewayEIP1" {
  tags = {
    Name    = "xpanse-NatgatewayEIP1"
    Project = "Architecture Design"
  }
}

resource "aws_eip" "NatgatewayEIP2" {
  tags = {
    Name    = "xpanse-NatgatewayEIP2"
    Project = "Architecture Design"
  }
}

resource "aws_nat_gateway" "Natgateway1" {
  allocation_id = aws_eip.NatgatewayEIP1.id
  subnet_id     = aws_subnet.xpanse_public1.id

  tags = {
    Name    = "xpanse_Natgateway1"
    Project = "Architecture Design"
  }
}

resource "aws_nat_gateway" "Natgateway2" {
  allocation_id = aws_eip.NatgatewayEIP2.id
  subnet_id     = aws_subnet.xpanse_public2.id

  tags = {
    Name    = "xpanse_Natgateway2"
    Project = "Architecture Design"
  }
}

#Internet Gateway

resource "aws_internet_gateway" "xpanse_igw" {
  vpc_id = aws_vpc.xpanse_main.id
  tags = {
    Name    = "xpanse_igw"
    Project = "Architecture Design"
  }
}