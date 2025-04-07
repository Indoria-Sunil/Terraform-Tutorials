resource "aws_iam_user" "user-name" {
  count = length(var.user_name)
  name  = var.user_name[count.index]
}

resource "aws_instance" "ec2_example" {
  ami           = "ami-00a929b66ed6e0de6"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform EC2"
  }
}
