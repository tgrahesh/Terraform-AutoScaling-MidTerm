terraform {
  backend "s3" {
    bucket = "terraform-statefiles-remote"
    key = "statefiles/autoscalingstate.tfstate"
    region = "eu-west-1"
    dynamodb_table = "TerraformLocks"

  }
}