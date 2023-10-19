output "vpc_id" {
  value = data.aws_vpc.my_vpc.id
}

output "subnet_ids" {
  value = [for s in data.aws_subnet.example : s.id]
}