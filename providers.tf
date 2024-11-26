terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAUX6CPNVOKUNGC"
  secret_key = "v5ovr2tNbAhmjcqIGwyj8HI7SDd0dn/tQtK"
}