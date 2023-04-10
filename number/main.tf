provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-007855ac798b5175e"
  instance_type = "t2.micro"
  count 	= var.instance_count

  tags = {
    Name = "terra-ec2"
  }
}

#variable declaration
variable "instance_count" {
  description   = "number of instances to make"
  type          = number
  default       = 2
}

