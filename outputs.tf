output "aws-instance-public-ip-address" {
  value = aws_instance.my-instance.public_ip
}