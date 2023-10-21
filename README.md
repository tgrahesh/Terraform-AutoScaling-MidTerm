# Load Testing and Auto-Scaling Project for High Availablilty of Web Server
This project demonstrates how to perform a load test using Postman and set up auto-scaling with AWS services, CloudWatch Alarms, Cloudwatch custom dashboard for displaying custom metrics and Lambda for reading metrics from custom dashboard created in cloudwatch and send reports via email(SES) using various terraform modules to provision and manage AWS resources for a web application. This architecture ensures that your application can handle traffic fluctuations, and you receive email notifications when CPU utilization exceeds a specified threshold. It also uses remote backend using AWS servcies like DynamoDB for storing terraform locks and S3 for remote state files.

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

# Package Dependancies(python)

-PDFKIT,JINJA2 python library package for generating PDF document

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

### 2. Set Up Auto Scaling with AWS

### 3. Create a Lambda Function

### 4. Test and Verify

### 5. Create CloudWatch Alarms that monitor the CPU utilization metric. Set up an alarm that triggers when CPU utilization exceeds 90%.

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

