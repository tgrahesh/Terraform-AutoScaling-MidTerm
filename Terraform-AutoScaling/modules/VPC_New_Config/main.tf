# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_block
   tags = {
    Name = var.VPC_Name  # Provide a name for your VPC here
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = var.internet_gateway_name  # Provide a name for your VPC here
  }
}

#provide internet gatway to main route table
resource "aws_route" "main_route" {
  route_table_id         = aws_vpc.my_vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"  # This is a default route for all internet-bound traffic
  gateway_id             = aws_internet_gateway.my_igw.id
}

/*
# Create a route table
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  # Define the default route for Internet Gateway
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
   tags = {
    Name = var.route_table_name  # Provide a name for your VPC here
  }

}
*/
# Create subnets in different availability zones within the VPC
resource "aws_subnet" "subnet" {
count = length(var.subnet_names)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = element(["11.0.0.0/24", "11.0.1.0/24","11.0.2.0/24"], count.index)
  availability_zone       = element(["eu-west-1a", "eu-west-1b","eu-west-1c"], count.index) # Replace with desired AZs
  map_public_ip_on_launch = true
  
}

