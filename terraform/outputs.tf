
output "ec2_public_ip" {
  description = "Public IP of Jenkins EC2 server"
  value       = aws_instance.jenkins_server.public_ip
}

output "jenkins_url" {
  description = "Jenkins dashboard URL"
  value       = "http://${aws_instance.jenkins_server.public_ip}:8080"
}

output "website_url" {
  description = "E-commerce website URL"
  value       = "http://${aws_instance.jenkins_server.public_ip}"
}
