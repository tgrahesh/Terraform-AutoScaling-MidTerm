output "autoscaling_group" {
  value = aws_autoscaling_group.my_auto_scaling_group.desired_capacity
}
output "autoscaling_group_name" {
  value = aws_autoscaling_group.my_auto_scaling_group.name
}