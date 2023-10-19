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
