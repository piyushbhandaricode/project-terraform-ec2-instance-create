terraform {
  backend "s3" {
    bucket = "tfstate-s3-backend-bucket"
    key    = "cloud_user/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tfstate-dynamodb-backend-table"
    encrypt = true
  }
}
