output "launch_template_id" {
  value = aws_launch_template.example.id
  
}
output "launch_template_version" {
  value = aws_launch_template.example.latest_version
}