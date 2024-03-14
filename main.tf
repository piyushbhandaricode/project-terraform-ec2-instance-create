provider "aws" {
    region = "us-east-1"
  
}

module "aws-ec2-instance" {
    source = "./modules/aws-ec2-instance"
    instance_type_value = "t2.micro"
    ami_value = "ami-07d9b9ddc6cd8dd30"
}