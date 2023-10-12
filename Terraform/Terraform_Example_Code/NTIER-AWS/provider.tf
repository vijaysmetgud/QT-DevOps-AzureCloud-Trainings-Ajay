terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.11.0"
    }
  }

  required_version = "1.5.3"

  /* # this below code is for store the state file into s3 bucket
  backend "s3" {
    bucket = 	"locktestingterraform"
    key    = "ntier-aws/terraform"
    region = "us-west-2"
    # this below code is to aquire state file lock 
    dynamodb_table = "terraformtesting"
  } */


}

provider "aws" {
  region = "us-west-2"
}

