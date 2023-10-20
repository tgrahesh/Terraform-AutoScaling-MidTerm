resource "aws_cloudwatch_dashboard" "custom_dashboard" {
  dashboard_name = var.custom_dashboard_name
  dashboard_body = jsonencode({
    widgets = [
        {
         "type":"text",
         "x":0,
         "y":0,
         "width":24,
         "height":2,
         "properties":{
          markdown = "## Auto Scaling Dashboard\nThis is a custom dashboard for my Auto Scaling group."
        }
      },
      {
         "type":"metric",
         "width":12,
         "height":6,
         "properties":{
            "metrics":[
               [ "AWS/AutoScaling","GroupDesiredCapacity","AutoScalingGroupName","var.autoscaling_group_name"],
               [ "AWS/AutoScaling","GroupInServiceInstances","AutoScalingGroupName","var.autoscaling_group_name"],
               [ "AWS/AutoScaling","GroupTotalInstances","AutoScalingGroupName","var.autoscaling_group_name"],
               [ "AWS/AutoScaling","GroupTerminatingInstances","AutoScalingGroupName","var.autoscaling_group_name"],
               [ "AWS/AutoScaling","GroupMaxSize","AutoScalingGroupName","var.autoscaling_group_name"],
               [ "AWS/AutoScaling","GroupMinSize","AutoScalingGroupName","var.autoscaling_group_name"]

            ],
            "period":300,
            "stat":"Average",
            "region":"var.region",
            "title":"Autoscaling group | Main Stats",
         }
      },
      {
         "type":"metric",
         "width":12,
         "height":6,
         "properties":{
            "metrics":[
               [ "AWS/ApplicationELB","RequestCount","LoadBalancer","var.ALB_name"],
               [ "AWS/ApplicationELB","HTTPCode_ELB_5XX_Count","LoadBalancer","ALB-Demo"],
               [ "AWS/ApplicationELB","ActiveConnectionCount","LoadBalancer","var.ALB_name"],
               [ "AWS/ApplicationELB","HTTPCode_ELB_4XX_Count","LoadBalancer","var.ALB_name"],
               [ "AWS/ApplicationELB","HTTPCode_Target_2XX_Count","LoadBalancer","var.ALB_name"],
               [ "AWS/ApplicationELB","HTTPCode_Target_4XX_Count","LoadBalancer","var.ALB_name"],
               [ "AWS/ApplicationELB","HTTPCode_Target_5XX_Count","LoadBalancer","var.ALB_name"],
               [ "AWS/ApplicationELB","TargetResponseTime","LoadBalancer","var.ALB_name"]

            ],
            "period":300,
            "stat":"Average",
            "region":"var.region",
            "title":"ALB | Main Stats",
         }
      },
      {
         "type":"metric",
         "width":12,
         "height":6,
         "properties":{
            "metrics":[
               [ "AWS/EC2","CPUUtilization","AutoScalingGroupName","var.autoscaling_group_name"],
               [ "AWS/EC2","StatusCheckFailed","AutoScalingGroupName","var.autoscaling_group_name"],
               [ "AWS/EC2","StatusCheckFailed_Instance","AutoScalingGroupName","var.autoscaling_group_name"],
               [ "AWS/EC2","StatusCheckFailed_System","AutoScalingGroupName","var.autoscaling_group_name"],
               [ "AWS/EC2","NetworkIn","AutoScalingGroupName","var.autoscaling_group_name"],
               [ "AWS/EC2","NetworkOut","AutoScalingGroupName","var.autoscaling_group_name"]

            ],
            "period":300,
            "stat":"Average",
            "region":"var.region",
            "title":"EC2 | Main Stats",
         }
      }

    ]
    
  })
}
