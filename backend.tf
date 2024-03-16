terraform {
  backend "s3" {
    bucket = "tfstate-s3-backend-bucket"
    key    = "my-folder/terraform.tfstate"
    region = "us-east-1"
  }
}
