terraform {
  backend "s3" {
    bucket = "terraform-statefiles-remote"
    key = "statefiles/autoscalingstate.tfstate"
    region = "eu-west-1"
    dynamodb_table = "TerraformLocks"

  }
}

#Enable versioning for my terraform state files
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = "terraform-statefiles-remote"
  versioning_configuration {
    status = "Enabled"
  }
}