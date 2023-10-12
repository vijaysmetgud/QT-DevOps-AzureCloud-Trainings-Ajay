terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }

  backend "s3" {
    bucket         = "locktestingterraform"
    key            = "terraform/s3"
    region         = "us-west-2"
    dynamodb_table = "mytable"

  }

}

provider "aws" {
  region = "us-west-2"
}


