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


variable "ami" {
  description = "AMI id"
  type        = string
  default     = "ami-00a929b66ed6e0de6"
}

variable "Instance_type" {
  description = "Instance_type"
  type        = string
  default     = "t2.micro"
}

variable "aws_instance_count" {
  description = "aws_instance_count"
  type        = number
  default     = 2
}

variable "enable_public_IP" {
  description = "enable_public_IP"
  type        = bool
  default     = true
}

variable "iam_username" {
  description = "aws_iam_username"
  type        = list(string)
  default     = ["user-1", "user-2", "user-3"]
}

variable "project_environment" {
  description = "project_environment"
  type        = map(string)
  default = {
    Project     = "Project-Alpha"
    Environment = "Dev"
  }
}
