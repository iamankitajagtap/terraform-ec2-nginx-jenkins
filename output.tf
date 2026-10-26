output "instance_name" {
  description = "Name of the instance"
  value       = aws_instance.var-tf-server.tags["Name"]
}

output "instance_id" {
  description = "ID of the instance"
  value       = aws_instance.var-tf-server.id
}

output "instance_public_ip" {
  description = "Public IP of the instance"
  value       = aws_instance.var-tf-server.public_ip
}

output "instance_private_ip" {
  description = "Private IP of the instance"
  value       = aws_instance.var-tf-server.private_ip
}