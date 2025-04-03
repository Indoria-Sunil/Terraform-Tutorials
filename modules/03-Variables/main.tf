provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Demo-Instance" {
  ami                         = var.ami
  instance_type               = var.Instance_type
  count                       = var.aws_instance_count
  associate_public_ip_address = var.enable_public_IP
  tags                        = var.project_environment
}

resource "aws_iam_user" "iam_user" {
  count = length(var.iam_username)
  name  = var.iam_username[count.index]

}



