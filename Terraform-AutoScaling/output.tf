output "vpc_id" {
  value = module.VPC_New_Config.vpc_id
}

output "subnet_ids" {
  value = module.VPC_New_Config.subnet_ids
}

output "internet_gateway_id" {
  value = module.VPC_New_Config.internet_gateway_id
}

output "route_table_id" {
  value = module.VPC_New_Config.route_table_id
}

output "SecurityGroup_id" {
 value = module.security_groups.SecurityGroup_id
}

output "target_group_arn" {
 value = module.TargetGroup.target_group_arn
}

output "launch_template_id" {
 value = module.LaunchTemplate.launch_template_id
}
output "ALB_arn" {
  value = module.ALB.ALB_arn
}
output "autoscaling_group" {
  value = module.autoscaling_group.autoscaling_group
}
output "dashboard_name" {
  value = module.CustomAutoScalingDashboard.dashboard
}