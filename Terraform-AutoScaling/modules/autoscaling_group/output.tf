output "autoscaling_group" {
  value = aws_autoscaling_group.my_auto_scaling_group.desired_capacity
}