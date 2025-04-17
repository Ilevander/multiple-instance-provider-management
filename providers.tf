// This file contains the provider configuration for AWS.
terraform {
  required_version = "~> 1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

//Instance 1 of aws provider
// This is the default provider instance, which is used when no alias is specified
provider "aws" {
  region = "eu-west-1"
}

//Instance 2 of aws provider
// This provider is aliased to "us-east" to differentiate it from the default provider instance
provider "aws" {
  region = "us-east-1"
  alias  = "us-east"
}


resource "aws_s3_bucket" "eu_west_1" {
  bucket = "some-random-bucket-name-aosdhfoadhfu"
}

resource "aws_s3_bucket" "us_east_1" {
  bucket   = "some-random-bucket-name-18736481364"
  provider = aws.us-east
}