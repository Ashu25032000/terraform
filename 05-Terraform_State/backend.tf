# Define Terraform backend using a S3 bucket for storing the Terraform state
terraform {
  backend "s3" {
    bucket = "terraform-s3-backend-2503"
    key = "terraform-state/terraform.tfstate"
    region = "ap-south-1"
    profile = "terraform"
 }
}