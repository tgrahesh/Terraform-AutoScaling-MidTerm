resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
security_groups = var.SecurityGroup_id
subnet_id = element(var.subnet_ids, 1) 
  tags = {
    Name = "terraform-EC2-LAMP-Instance"
  }

    user_data = file("${path.module}/LAMPStack.sh")
}

resource "aws_ami_from_instance" "LAMPStackAMI" {
  name               = "var.AMI_Name"
  source_instance_id = aws_instance.ec2_instance.id
}

/*data "aws_ebs_snapshot" "latest_snapshot" {
  most_recent = true

  filter {
    name   = "tag:Name"
    values = ["terraform-EC2-LAMP-Instance"]
  }
}
*/
