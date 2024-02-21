terraform {
  backend "s3" {
    bucket         = "terraform-state-kot2na"    # your-bucket-name 
    key            = "."        # path/to/your/terraform.tfstate
    region         = "eu-north-1"             # your-region 
  }
}