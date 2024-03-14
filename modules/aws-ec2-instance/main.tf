provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my-instance" {
    ami = var.ami_value
    instance_type = var.instance_type_value
    tags = {
      Name = "aws-instance-${timestamp()}"
    }
  
}