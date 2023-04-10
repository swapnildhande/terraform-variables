provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "example" {
  count = length(var.user_name)
  name = var.user_name[count.index]
}

# variable declaration
variable "user_name" {
  description   = "iam user list"
  type          = list(string)
  default       = ["user1", "user2", "user3"]
}

output "iam_users" {
  value = aws_iam_user.example[*].name
}
