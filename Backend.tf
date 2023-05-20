terraform {
  backend "s3" {
    bucket = "ojinitech"
    region = "us-east-1"
    key = "Jenkins server/terrafrom.tfstate"
  }
}