resource "aws_instance" "staging-ec2" {
    ami = "ami-00a929b66ed6e0de6"
    instance_type = "t2.micro"
    

    tags = {
      Name = "EC2-instance"
    }
}

output "my-console-output" {
    value = aws_instance.staging-ec2.public_ip  
}