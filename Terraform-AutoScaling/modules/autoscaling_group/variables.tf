variable "subnet_ids" {
  type    = list(string)
}

variable "target_group_arns" {
  type    = list(string)
  default = []
}

variable "launch_template_id" {

}

variable "launch_template_version" {

}