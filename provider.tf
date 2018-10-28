provider "aws" {
  region = "${var.region}"
}

terraform{
    backend "s3" {
        bucket = "terraforms3bucket2"
        key = "Dev1/terraform.tfstate"
        region = "ap-south-1"
    }
}



