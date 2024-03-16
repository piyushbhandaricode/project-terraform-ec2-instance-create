provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "tf-s3-remote-bucket" {
  bucket = "tfstate-s3-backend-bucket"
  tags = {
    Environment = "Dev"
  }
  
}

resource "aws_s3_bucket_versioning" "tf-s3-remote-backend-versioning" {
  bucket = aws_s3_bucket.tf-s3-remote-bucket.id
  lifecycle {
    prevent_destroy = true
  }
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf-s3-remote-backend-encryption" {
  bucket = aws_s3_bucket.tf-s3-remote-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


#locking part

resource "aws_dynamodb_table" "tf-dynamodb-remote-backend-locking" {
  hash_key = "LockID"
  name = "tfstate-dynamodb-backend-table"
  attribute {
    name = "LockID"
    type = "S"
  }

  billing_mode = "PAY_PER_REQUEST"
}