# Highly Available Web Application Deployment with Terraform
This project demonstrates how to perform a load test using Postman and set up auto-scaling with AWS services, CloudWatch Alarms, Cloudwatch custom dashboard for displaying custom metrics and Lambda for notifications using various terraform modules to provision and manage AWS resources for a web application. This architecture ensures that your application can handle traffic fluctuations, and you receive email notifications when CPU utilization exceeds a specified threshold. It also uses remote backend using AWS servcies like DynamoDB for storing terraform locks and S3 for remote state files.

# Objective

The primary objective of this project is to create a robust and scalable architecture for a web application that can handle traffic fluctuations and ensure high availability. It uses a combination of AWS services to achieve this goal.

# AWS Services Used
-VPC

-EC2

-ALB

-AutoScaling

-CloudWatch

-S3 Bucket

-DynamoDB

-Lambda

-IAM

-SES

# Other Technologies/tools Used
-Postman

-PDFKIT python library package for generating PDF document

# AWS Infrastructure as Code with Terraform

This repository contains Terraform modules and configurations to provision and manage AWS resources for a web application. It follows best practices for infrastructure as code and modularization.

## Modules Overview

### 1. VPC Configuration (VPC_New_Config)

- This module sets up a Virtual Private Cloud (VPC) with the specified subnets, route tables, and other network configurations.

### 2. Security Groups (Security_Groups)

- The Security Groups module creates security groups that define inbound and outbound traffic rules for your resources. It ensures proper network security.

### 3. EC2 Instances (ec2_config)

- This module provisions EC2 instances within the VPC's subnets and attaches the specified security groups. It allows for launching instances with desired configurations.

### 4. Launch Template (LaunchTemplate)

- The Launch Template module defines instance specifications, such as instance type, AMI, and user data, for use in Auto Scaling groups.

### 5. Target Group (TargetGroup)

- This module creates an Elastic Load Balancer (ELB) target group, which is used for routing traffic to instances in the VPC.

### 6. Application Load Balancer (ALB)

- The ALB module sets up an Application Load Balancer with the specified subnets, security groups, and target group configuration.

### 7. Auto Scaling Group (autoscaling_group)

- The Auto Scaling Group module configures Auto Scaling for instances. It ensures that the desired number of instances are maintained based on load and instances launched from the specified launch template.
### 8. CloudWatchAlarm (CloudwatchAlarm)

Create a CloudWatch Alarm that monitors CPU utilization of ec2 instances in my autoscaling group and creates an alarm when my condition is met(CPU utilization>80)

### 9. LambdaFunction (LambdaFucntion)

The Python script that implements the Lambda function logic. This script reads the CloudWatch dashboard when alarm gets generated, and in turn generates a PDF report, and sends it via SES where my python files and other package dependancies are stored in s3 bucket. This Lambda function will be triggered by the CloudWatch Alarm.

## Steps

### 1. Create a Load Test in Postman

1. Open Postman and create a collection for your load test.

2. Add a request to your collection, targeting the URL of your Application Load Balancer (ALB).

3. Create test scripts in Postman to simulate different load test scenarios. You can generate various requests with different payloads and parameters to simulate real-world traffic.

4. Use Postman's collection runner to execute the load test by running the collection with multiple iterations and requests.

### 2. Set Up Auto Scaling with AWS

1. Create an Auto Scaling group and configure it with a Launch Configuration or Launch Template.

2. Set up scaling policies that trigger Auto Scaling based on CPU utilization exceeding 90%. You can configure scaling policies to add or remove instances from the Auto Scaling group.

3. Create CloudWatch Alarms that monitor the CPU utilization metric. Set up an alarm that triggers when CPU utilization exceeds 90%.

4. Configure the alarm to take action when it breaches its threshold. Define actions to trigger when the alarm state changes to "ALARM."

### 3. Create a Lambda Function

1. Develop a Lambda function that sends email notifications which takes metrics from my custom cloudwatch dashboard and generate a PDF file with all metrics and send email notification by using pdfkit python library

3. The Lambda function take parameters like the subject, recipient email address, and email body. It also includes the relevant logs, data from cloudwatch custom dashboard, and timestamps.

4. Set up the function to be triggered by a CloudWatch Alarm action. When the alarm state changes to "ALARM," the Lambda function should be executed.

5. In your Lambda function, you can use AWS Simple Email Service (SES)  to send email notifications with the relevant data and logs.

### 4. Test and Verify

1. Execute the load test in Postman to generate the desired traffic to your ALB.

2. Monitor the CPU utilization in AWS CloudWatch to ensure it exceeds 90%, which should trigger the Auto Scaling action.

3. Verify that the CloudWatch Alarm changes to "ALARM" status, triggering the Lambda function.

4. Check your email for the notification with the logs, pdf attatchment, data, and timestamp.

Please ensure that you've properly configured security groups, IAM roles, and permissions for your Lambda function and other AWS services. Additionally, make sure that your Lambda function has the required environment variables and configurations for sending email notifications.

## Note

- Ensure that you have AWS credentials and Terraform installed. You can configure your AWS credentials using AWS CLI or environment variables.

- Review and adjust the variables and configuration in the respective module source directories to match your specific requirements.

## Usage

1. **Terraform Configuration**:

   - Configure the Terraform modules and variables in your project according to your application's specific requirements.

2. **Terraform Init**:

   - Run `terraform init` to initialize the working directory.

3. **Terraform Plan**:

   - Use `terraform plan` to review the execution plan and verify that the infrastructure changes align with your expectations.

4. **Terraform Apply**:

   - Execute `terraform apply` to create the AWS resources based on the configuration defined in the Terraform modules.

5. **Terraform Destroy**:

   - If necessary, you can use `terraform destroy` to tear down the infrastructure.

## Monitoring and Maintenance

- Continuously monitor and maintain the resources for optimal performance, security, and availability. Configure cloudwatch alarms and monitoring for key metrics.

