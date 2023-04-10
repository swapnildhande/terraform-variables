provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-007855ac798b5175e"
  instance_type = "t2.micro"
  associate_public_ip_address = var.enable_public_ip

  tags = {
    Name = "terra-ec2"
  }
}

output "instance_id" {
  value = aws_instance.example.id
}

# variable declaration
variable "enable_public_ip" {
  description   = "Enable public ip"
  type          = bool
  default       = true
}

