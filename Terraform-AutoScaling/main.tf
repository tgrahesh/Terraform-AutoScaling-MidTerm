
module "VPC_New_Config" {
  source = "./modules/VPC_New_Config"
}

module "security_groups" {
  source = "./modules/Security_Groups"
  vpc_id = module.VPC_New_Config.vpc_id
}
module "ec2_instance" {
  source = "./modules/ec2_config"
  subnet_ids = module.VPC_New_Config.subnet_ids
 SecurityGroup_id = module.security_groups.SecurityGroup_id
 AMI_Name = var.AMI_Name
}
module "LaunchTemplate" {
  source = "./modules/LaunchTemplate"
}

module "TargetGroup" {
  source = "./modules/TargetGroup"
  vpc_id = module.VPC_New_Config.vpc_id
}

module "ALB" {
  source = "./modules/ALB"
  subnet_ids = module.VPC_New_Config.subnet_ids
  target_group_arn = module.TargetGroup.target_group_arn
  SecurityGroup_id = module.security_groups.SecurityGroup_id
}

module "autoscaling_group" {
  source = "./modules/autoscaling_group"
  target_group_arns = module.TargetGroup.target_group_arns
  subnet_ids = module.VPC_New_Config.subnet_ids
  launch_template_id = module.LaunchTemplate.launch_template_id
  launch_template_version = module.LaunchTemplate.launch_template_version

}

module "CustomAutoScalingDashboard" {
  source = "./modules/CloudWatch_CutomDashboard"
  autoscaling_group_name = module.autoscaling_group.autoscaling_group_name
  ALB_name = module.ALB.ALB_name
  
}

/*module "CloudwatchAlarm" {
  source = "./modules/CloudwatchAlarm"
  autoscaling_group_name = module.autoscaling_group.autoscaling_group_name
}
*/