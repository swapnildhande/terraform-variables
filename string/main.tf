provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-007855ac798b5175e"
  instance_type = var.instance_type

  tags = {
    Name = "terra-ec2"
  }
}

output "instance_id" {
  value = aws_instance.example.id
}

# variable declaration
variable "instance_type" {
  description	= "Instance type t2.micro"
  type		= string
  default	= "t2.micro"
}
