terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }
}


provider "aws" {
    region = "us-east-1"
    skip_credentials_validation = true
    skip_metadata_api_check = true
    skip_requesting_account_id = true
    s3_use_path_style           = true

    endpoints {
      ec2            = "http://localhost:4566"
      s3             = "http://s3.localhost.localstack.cloud:4566"
      cloudwatch     = "http://localhost:4566"
      cloudwatchlogs = "http://localhost:4566"
      iam            = "http://localhost:4566"
      lambda         = "http://localhost:4566"
      sts            = "http://localhost:4566"
    }
  
}

resource "aws_instance" "web-server" {
  ami = "ami-06ca3ca175f37dd66"
  instance_type = "t2.micro"
  count = 5
  tags = {
    Name = "web-server-${count.index}"
  }
}

# Create a bucket
resource "aws_s3_bucket" "test-bucket" {
  bucket = "my-bucket"
}

resource "aws_s3_bucket_acl" "test-bucket-acl" {
  bucket = aws_s3_bucket.test-bucket.id
  acl = "public-read" # or can be "private"
}

# resource "aws_s3_bucket_notification" "s3_lambda_trigger" {
#   bucket = aws_s3_bucket.test-bucket.id
#   lambda_function {
#     lambda_function_arn = aws_lambda_function.s3_lambda.arn
#     events = ["s3:ObjectCreated:*"]

#   }
# }
