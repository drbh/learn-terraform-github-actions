terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    random = {
      source = "hashicorp/random"
    }
  }

  backend "remote" {
    organization = "drbh"

    workspaces {
      name = "learn-terraform-github-actions"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "b" {
  bucket = "gh-action-bucket-test"
  acl    = "private"

  tags = {
    Name = "gh-action-bucket-test"
  }
}
