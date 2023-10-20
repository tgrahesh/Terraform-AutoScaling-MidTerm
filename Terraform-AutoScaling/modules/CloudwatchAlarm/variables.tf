variable "alarm_name" {
default = "Terraform-CPU-Alarm"
}

variable "autoscaling_group_name" {
}

variable "thresholdvalue" {
type = number
default = 70
}

