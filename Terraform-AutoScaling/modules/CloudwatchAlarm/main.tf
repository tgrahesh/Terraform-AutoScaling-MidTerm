resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 1
  metric_name        = "CPUUtilization"
  namespace          = "AWS/EC2"
  period             = 60  # The duration for each data point in seconds
  statistic          = "Average"
  threshold          = var.thresholdvalue
  alarm_description   = "CPU utilization exceeds var.thresholdvalue% for Auto Scaling group"

  dimensions = {
    AutoScalingGroupName = var.autoscaling_group_name
  }
}