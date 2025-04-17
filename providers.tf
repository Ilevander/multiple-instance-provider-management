terraform {
  required_version = "~> 1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Default AWS provider - EU West
provider "aws" {
  region = "eu-west-1"
}

# Aliased AWS provider - US East
provider "aws" {
  region = "us-east-1"
  alias  = "us-east"
}

# EU West Bucket
resource "aws_s3_bucket" "eu_west_1" {
  bucket   = "dell-alli-eu-west-${random_id.bucket_suffix.hex}"
  provider = aws
}

# US East Bucket
resource "aws_s3_bucket" "us_east_1" {
  bucket   = "dell-alli-us-east-${random_id.bucket_suffix.hex}"
  provider = aws.us-east
}

# Random suffix to ensure uniqueness
resource "random_id" "bucket_suffix" {
  byte_length = 4
}
