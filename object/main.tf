provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-007855ac798b5175e"
  instance_type = var.instance_object.size
  tags = var.instance_object.tags
}

output "instance_id" {
  value = aws_instance.example.id
}

# variable declaration
variable "instance_object" {
  type = object({
    name = string
    size = string
    tags = map(string)
  })
  default = {
    name = "my-instance"
    size = "t2.micro"
    tags = {
      environment = "dev"
      peojct = "my-project"
    }
  }
}


