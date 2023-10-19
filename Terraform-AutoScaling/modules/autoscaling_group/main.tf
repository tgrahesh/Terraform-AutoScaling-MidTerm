# Create an Auto Scaling Group
resource "aws_autoscaling_group" "my_auto_scaling_group" {
  name_prefix = "Terraform-ASG"
  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }
  min_size             = 1
  max_size             = 4
  desired_capacity     = 1
  vpc_zone_identifier  = var.subnet_ids # Replace with your subnet IDs
  target_group_arns = var.target_group_arns
  
}
  

# Create a target tracking scaling policy with CPU utilization metric
resource "aws_autoscaling_policy" "my_scaling_policy" {
  name                   = "my-target-tracking-policy"
   policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.my_auto_scaling_group.name
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 2  # Set your target CPU utilization (e.g., 70%)
  }
}

