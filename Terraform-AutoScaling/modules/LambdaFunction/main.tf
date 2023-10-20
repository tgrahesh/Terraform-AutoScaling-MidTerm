resource "aws_iam_role" "lambda_execution_role" {
  name = "Autoscaling-Grahesh"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_lambda_function" "my_lambda_function" {
  function_name = "var.lambda_function_name"
  handler = "lambda_function.lambda_handler"
  runtime = "python3.8"

  # Lambda function code (a simple example)
  s3_bucket = "LambdaFunction-s3"  # Replace with your S3 bucket name
  s3_key    = "lambda/Autoscaling_lambda_function.zip"  # Replace with the path to your Lambda code package in S3

  role = aws_iam_role.lambda_execution_role.arn

  # Log the Lambda function output to CloudWatch Logs
  environment {
    variables = {
      LOG_GROUP_NAME  = "/aws/lambda/my-lambda-function"
      LOG_STREAM_NAME = "my-lambda-stream"
    }
  }
}