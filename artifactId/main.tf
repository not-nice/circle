provider "aws" {
  region     = "us-east-1"  # Change this to your desired AWS region
  access_key = "ASIARL7AWOA4UMA6DLVM"
  secret_key = "ylgayZ5867DbMSCXBhovZpi80t4HeAsEgR34bPAI"
  #token     = "FwoGZXIvYXdzEB4aDCaISQQ5wL5M3GReayLXASbPlZwu7TuHAZPXdUMND0hi9SukuTLLUh9q1RgkQ8TyBr3m0izuMrbQ8y7Bc/sC5v3lRK2Fz3LE/VspRLNLHqN5c3uS9hr0oa6RwZRXr3cWqZ+5foN/xQ0UpdqJAYrXweGf7/s5RVbKbkxDOUo1+LeXPi2AB1vSVDNAhgi1RtL9y0PPkJ4UHBfwBNNx3KiWeWVzxYv28gFKwuUTG2D9e7SN/j0wj7rgjG/oxHXQ7ekyI8E3f/883G1/lxaSz8pZvwZnBaKtOwG801prsfXjbRHj1I/sC1BOKLLvja4GMi0hRugBqMRKM5SsX/n7LjZBXMZWdSKNY+0tyYIHzpZuuVCS4yUl1+yuq5UnNpE="
}


# Resource Definitions
resource "aws_instance" "Instance-1" {
  ami           = "ami-0c7217cdde317cfec"  # Change this to a valid AMI ID
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "awss3bucket92"
  # other configurations...
}
