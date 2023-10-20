variable "ami" {
  default = "ami-01dd271720c1ba44f" # Ubuntu 20.04 LTS AMI (may vary by region)
}

variable "instance_type" {
  default = "t2.micro" # Change to your preferred instance type
}

variable "key_name" {
  default = "LoadTest" # Change to your key pair name
}

variable "SecurityGroup_id" {
    type    = list(string)
}

variable "subnet_ids" {
  
}
variable "AMI_Name" {
  default = "Terraform-AMI"
}