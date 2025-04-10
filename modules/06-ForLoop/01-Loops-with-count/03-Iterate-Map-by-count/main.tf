provider "aws" {
    region = "us-east-1"  
}

variable "iam_users" {
  type = map(string)
  default = {
    alice = "Admin"
    bob   = "Developer"
    carol = "ReadOnly"
  }
}

locals {
  user_name = keys(var.iam_users)
  group_names = values(var.iam_users)
}

#Step 3: iterate over map using keys and count.index meta argument
resource "aws_iam_user" "users" {
  count = length(local.user_name)

  name  = local.user_name[count.index]
  force_destroy = true
}


resource "aws_iam_group" "groups" {
    count = length(var.iam_users)
    name = local.group_names[count.index]  
}

resource "aws_iam_user_group_membership" "Demo" {
  count = length(local.user_name)
  user  = aws_iam_user.users[count.index].name
  groups = [
    aws_iam_group.groups[index(local.group_names, var.iam_users[local.user_name[count.index]])].name
  ]
}
