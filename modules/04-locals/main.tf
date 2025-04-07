locals {
  staging_env = "staging"
}


resource "aws_vpc" "staging-vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
      Name = "${local.staging_env}-vpc-tag"
    }      
}

resource "aws_subnet" "staging-subnet" {
    vpc_id = aws_vpc.staging-vpc.id
    cidr_block = "10.0.1.0/24"


    tags = {
      Name = "${local.staging_env}-subnet-tag"
    }  
}

resource "aws_instance" "staging-ec2" {
    ami = "ami-00a929b66ed6e0de6"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.staging-subnet.id

    tags = {
      Name = "${local.staging_env}-instance"
    }
}