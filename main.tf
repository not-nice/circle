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
  access_key = "ASIARL7AWOA4VV5S5INR"
  secret_key = "qJZg/laYGL0tc3on+X24gnbtBVPe4X9hlw4hO1ZO"
  token      = "FwoGZXIvYXdzELL//////////wEaDK/Cdc33zwrrzrVpuiLXAaaswEmNIPe0ZF5iJslI3n1rfqiNmFTaGvS9wu/BMfk3MLq4mQOt9JQXsnPR+SZ7G+4nHqwmhu+J4bTxV92+IPXIVIGC4u9yzEJsWOgrrOif1dIEDWipoWg9WS4lxYh8/bH02KKbEISQjVVnbyOCfYCtF+ajsqh8I76ysG/8nl9/J2u3/RZIcdNBesVtDDKh1UJ/uDTMxr2TUBp0F0+9ZRDXdnqI89nUq4IAEIOvHRdwaoib2nQWaIJVhfu1Pm/Z3s16CJzat8rGimEzCgWKaV9kanDuwzvFKLm/rq4GMi2/unoxr2EwKQjTU7CDbvjdRSqjTS0/VkqKSW8qmWtIgk7yPkD6iO2RPkGvbUM="
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
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"  # CIDR block for the public subnet
  map_public_ip_on_launch = true     # Enable automatic assignment of public IP addresses

  lifecycle {
    ignore_changes = [map_public_ip_on_launch]
  }

  tags = {
    Name = "PublicSubnet"
  }
}

# Create a private subnet in the VPC
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/24"  # CIDR block for the private subnet

  tags = {
    Name = "PrivateSubnet"
  }
}

# Resource Definitions
resource "aws_instance" "Instance-1" {
  ami           = "ami-0c7217cdde317cfec"  # Change this to a valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id  # Use the ID of the public subnet
  associate_public_ip_address = true           # Assign a public IPv4 address to the instance

  key_name      = "vockey"  # Replace with the name of your key pair

  tags = {
    Name = "MyInstance"
  }
}

# Define a security group for the EC2 instance
resource "aws_security_group" "public_ec2_sg" {
  vpc_id = aws_vpc.my_vpc.id  # Use the VPC created above

  # Allow inbound HTTP traffic (port 80) from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound SSH traffic (port 22) from your IP address (replace YOUR_IP)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["100.25.151.34/32"]  # Replace YOUR_IP with your public IP address
  }

  # Allow outbound traffic to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "PublicEC2SecurityGroup"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "awss3bucket56"
  # other configurations...
}
