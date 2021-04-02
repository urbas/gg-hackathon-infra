locals {
  main_subnet = aws_subnet.gg_hackathon["eu-west-1b"]
}

resource "aws_vpc" "gg_hackathon" {
  cidr_block                       = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = true

  tags = {
    "Name" = "gg_hackathon"
  }
}

resource "aws_subnet" "gg_hackathon" {
  for_each = {
    eu-west-1a = 0
    eu-west-1b = 1
    eu-west-1c = 2
  }

  vpc_id            = aws_vpc.gg_hackathon.id
  cidr_block        = cidrsubnet(aws_vpc.gg_hackathon.cidr_block, 3, each.value)
  ipv6_cidr_block   = cidrsubnet(aws_vpc.gg_hackathon.ipv6_cidr_block, 8, each.value)
  availability_zone = each.key

  tags = {
    Name = "gg_hackathon-${each.key}"
  }
}

resource "aws_route_table_association" "gg_hackathon" {
  for_each       = aws_subnet.gg_hackathon
  subnet_id      = each.value.id
  route_table_id = aws_vpc.gg_hackathon.main_route_table_id
}

resource "aws_internet_gateway" "gg_hackathon" {
  vpc_id = aws_vpc.gg_hackathon.id

  tags = {
    Name = "gg_hackathon"
  }
}

resource "aws_route" "gg_hackathon-ipv4" {
  route_table_id         = aws_vpc.gg_hackathon.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gg_hackathon.id
}

resource "aws_route" "gg_hackathon-ipv6" {
  route_table_id              = aws_vpc.gg_hackathon.main_route_table_id
  destination_ipv6_cidr_block = "::/0"
  gateway_id                  = aws_internet_gateway.gg_hackathon.id
}

resource "aws_security_group" "sg" {
  name   = "sg"
  vpc_id = aws_vpc.gg_hackathon.id

  ingress {
    description      = "SSH from everywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "server"
    from_port        = 8180
    to_port          = 8280
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sg"
  }
}