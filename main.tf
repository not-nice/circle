terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"  # Change this to your desired AWS region
  access_key = "ASIARL7AWOA47OIDULX3"
  secret_key = "zpa0/oTM3Fwqk4COo8Zg702cpW5qqhhmeIBYDy17"
  token      = "FwoGZXIvYXdzELL//////////wEaDDtUlJcLBVnZfZk6ViLXAVQ2kng80g2u9A6io9JKCxEcEW1goHiCnXpKnEjtYZexjZ7q7c+zoG+l+m3IvJH9oWylajp8tQdHCE8hL2n9JgjXQwpIzNkE7fM+DdnpReakd9EWR+ijfKbb3HmEqHja+D6ho+Hxuwo1xwoRsFd9gLshv6s2CdFMmwS2EnIspDiPgPmM4fwV/p80efwSKvHXgB8VvdBolNCezTCJVdDYJDXEPRZATp+AO+crTdL8VAp30I1u3yqrfvF7kcfvTcTvUNLKArFbqCMvkhqRBNJ4JHi8UDgAREx9KJSprq4GMi0A9/JNpLlJSOGTcpght7kBprmLAxMOLvRuTgf++kssISfbhXmW7KlSulLwMQ4="
}

# Create the VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"  # CIDR block for the VPC network

  tags = {
    Name = "MyVPC"
  }
}

# Create a public subnet in the VPC
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"  # CIDR block for the public subnet
  map_public_ip_on_launch = true  # Enable automatic assignment of public IP addresses

  tags = {
    Name = "PublicSubnet"
  }
}

# Create a private subnet in the VPC
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"  # CIDR block for the private subnet

  tags = {
    Name = "PrivateSubnet"
  }
}

# Set up RDS instance
resource "aws_db_instance" "my_database" {
  engine         = "mysql"
  instance_class = "db.t2.micro"
  allocated_storage = 20
  identifier     = "my-database56-instance"
  username       = "admin"
  password       = "admin"
}

# Resource Definitions
resource "aws_instance" "Instance-1" {
  ami           = "ami-0c7217cdde317cfec"  # Change this to a valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id  # Use the ID of the public subnet
  associate_public_ip_address = true  # Assign a public IPv4 address to the instance

  tags = {
    Name = "MyInstance"
  }
}

# Define a security group for the EC2 instance
resource "aws_security_group" "public_ec2_sg" {
  vpc_id = aws_vpc.my_vpc.id  # Use the VPC created above

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allowing inbound traffic from anywhere on port 80
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allowing outbound traffic to anywhere
  }

  tags = {
    Name = "PublicEC2SecurityGroup"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "awss3bucket56"
  # other configurations...
}
