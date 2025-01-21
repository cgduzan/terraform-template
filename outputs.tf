# Terraform loads all files in the current directory ending in .tf, so you can name your configuration files however you choose.

# Output blocks define the values that are output from Terraform after it runs the configuration.
# These can be used to pass information to other parts of your infrastructure.
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}
