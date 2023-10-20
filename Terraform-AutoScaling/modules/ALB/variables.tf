variable "subnet_ids" {
  type    = list(string)
  
}
variable "target_group_arns" {
      type    = list(string)
  default = []
}
variable "target_group_arn" {

}
variable "SecurityGroup_id" {
    type    = list(string)
  default = []
}


variable "AWS_ALB_Name" {
  default = "Terraform-ALB"
  
}
