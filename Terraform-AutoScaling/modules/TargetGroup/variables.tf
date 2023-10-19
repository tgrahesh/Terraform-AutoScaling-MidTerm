variable "vpc_id" {
    type = string
}

variable "target_group_name" {
  type    = string
  default = "terraform-target-group"  # Replace with your VPC ID
}