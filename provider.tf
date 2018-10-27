provider "aws" {
  region = "${var.region}"
}

terraform{
    backend "s3" {
        bucket = "terraforms3bucket1"
        key = "Dev/terraform.tfstate"
        region = "ap-south-1"
    }
}



