provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-007855ac798b5175e"
  instance_type ="t2.micro" 

  tags = var.project_env
}

output "instance_id" {
  value = aws_instance.example.id
}

# variable declaration
variable "project_env" {
  description   = "project name and env"
  type          = map(string)
  default       = {
	project	= "project-alpha",
	env 	= "dev"
  }
}

