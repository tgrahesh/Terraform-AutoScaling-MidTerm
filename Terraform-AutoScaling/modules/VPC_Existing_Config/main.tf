
data "aws_vpc" "my_vpc" {
  tags = {
    Name = var.vpc_id  # Replace with the name of your VPC
  }
}

data "aws_subnets" "my_subnets" {
   filter {
 name = "vpc-id"
values = [var.vpc_id]
  }
}

data "aws_subnet" "example" {
  for_each = toset(data.aws_subnets.my_subnets.ids)
  id       = each.value
}


