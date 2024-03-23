terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
  
  backend "s3" {
    bucket         = "terraform-state-kot2na"    # your-bucket-name 
    key            = "."        # path/to/your/terraform.tfstate
    region         = "eu-north-1"             # your-region 
  }
}

resource "aws_vpc" "main" {
  cidr_block       = "172.31.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

variable "region" {
  default = "eu-north-1"
}

provider "aws" {
  region = var.region
}
