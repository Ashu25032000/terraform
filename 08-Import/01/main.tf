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

# Create an EC2 instance
 resource "aws_instance" "example" {
    ami           = "ami-0b982602dbb32c5bd"
    instance_type = "t3.small"
    key_name = "ashwini"
    tags = {
      "Name" = "docker"
    }
 }
