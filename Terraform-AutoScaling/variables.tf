variable "subnet_names" {
  type    = list(string)
  default = ["terraform-SubnetA", "terraform-SubnetB","terraform-SubnetB"]
}

variable "VPC_Name" {
  type    = string
  default = "terraform-VPC"
}

variable "internet_gateway_name" {
  type    = string
  default = "terraform-igw"
}

variable "route_table_name" {
  type    = string
  default = "terraform-route-table"
}

variable "target_group_name" {
  type    = string
  default = "terraform-target-group"  # Replace with your VPC ID
}

variable "SG_Name" {
  type    = string
  default = "Terraform-SecurityGroup"
}

variable "snapshot_id" {
  type    = string
  default = "snap-04df0d2473a226073"  # Replace with your snapshot ID
}

variable "name_prefix" {
  type    = string
  default = "terraform"  # Replace with your name prefix
}

variable "key_name" {
  type    = string
  default = "LoadTest"  # Replace with your key pair name
}