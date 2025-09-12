# Configure the AWS provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.10.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
  profile = "terraform"
}

# Create a S3 bucket
resource "aws_s3_bucket" "aws_bucket" {
  bucket		  = "${var.bucket_name}"
}