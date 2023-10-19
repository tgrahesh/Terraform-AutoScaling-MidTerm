resource "aws_lb_target_group" "my_target_group" {
  name        = var.target_group_name  # Replace with your desired Target Group name
  port        = 80               # Specify the port that the Target Group will listen on
  protocol    = "HTTP"           # Specify the protocol (HTTP, HTTPS, TCP, etc.)
  vpc_id      = var.vpc_id  # Replace with your VPC ID

  health_check {
    path                = "/"   # Specify the health check path
    protocol            = "HTTP"  # Health check protocol
    port                = "traffic-port"  # Port to perform health checks on
    interval            = 30    # Health check interval in seconds
    timeout             = 10    # Health check timeout in seconds
    healthy_threshold   = 2     # Number of consecutive successful health checks
    unhealthy_threshold = 2     # Number of consecutive failed health checks
  }

  tags = {
    Name = var.target_group_name  # Optional tags for your Target Group
  }
}
