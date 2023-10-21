resource "aws_security_group" "AS_SecurityGroup" {
  name        = "Autoscaling-SecurityGroup"
  description = "Allow TLS,http,SSH inbound traffic"
  vpc_id = var.vpc_id
      tags = {
      Name = var.SG_Name
    }
  # Inbound rule for SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["11.0.0.0/16"]
  }

  # Inbound rule for HTTP (port 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["11.0.0.0/16"]
  }

  # Default inbound rule for all traffic within the security group
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # This means all protocols
    self        = true   # Traffic from instances associated with the same security group
  }

  # Outbound rule for all traffic (optional)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # This means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
