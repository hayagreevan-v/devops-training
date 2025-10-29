terraform {
  backend "s3" {
    bucket = "hex-s3-bucket-1"
    key    = "tfstate/terraform.tfstate"
    region = "us-east-1"
  }
}
