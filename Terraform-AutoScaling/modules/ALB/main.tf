# Create a load balancer
resource "aws_lb" "ALB" {
  name               = var.AWS_ALB_Name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.SecurityGroup_id
  subnets            = var.subnet_ids
  enable_deletion_protection = false
  }

# Create a listener for the load balancer
resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.ALB.arn
  port              = 80
  protocol          = "HTTP"

default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
  }

  