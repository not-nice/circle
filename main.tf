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
  access_key = "ASIARL7AWOA4XW4CRPLY"
  secret_key = "QXQAKcR7M/eTht5wOcT+N5C4hGMOh9rYHeiAR/5p"
  token      = "FwoGZXIvYXdzEJ7//////////wEaDKg5yTF8uKCg1ePjCiLXAXS8JsVjDJ1IndchUnMAsJsVKbwf25jta8UgTvMPxrgLS0ITaNWbUY2s8OEXBgmYToaEQq/7Iucs7mBFOxOgnWIVi31NnFR/ywEK4GSxCwKgdFQxwU8x8fFvUcA0/sAe6BeF8ptneYW+92Dcrk58cqQyKGlgSaeCzZojAFmxYju7goSG6Ki3uJ0PKOhwK6GDirkHSGku0++Qn5LR9C6mC7lSvR8l7ZekRv1T9nZleziCojV+QKgWgXB34CsPOv594KsQ7oYcpVE1BAL6U8W59W4M1YmTsC/gKMr+qa4GMi1fujEMwwbJ8k5cejkill9nFiLHJdjd8PCw28tDwdNVHAzAi/JQ0Jx+U3n3API="
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

# Resource Definitions
resource "aws_instance" "Instance-1" {
  ami           = "ami-0c7217cdde317cfec"  # Change this to a valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id  # Use the ID of the public subnet
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
