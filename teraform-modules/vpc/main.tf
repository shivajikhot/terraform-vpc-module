resource "aws_vpc" "demo" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "DEMO"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = var.public_subnet_cidr

  tags = {
    Name = "public"
  }
}

resource "aws_subnet" "privet" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = var.privet_subnet_cidr

  tags = {
    Name = "privet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.demo.id

  tags = {
    Name = "internet_gatewy"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.demo.id

  tags = {
    Name = "public_route_table"
  }
}


resource "aws_route_table" "privet" {
  vpc_id = aws_vpc.demo.id

  tags = {
    Name = "privet_route_table"
  }
}




resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id

}


resource "aws_route_table_association" "privet" {
  subnet_id      = aws_subnet.privet.id
  route_table_id = aws_route_table.privet.id

}
