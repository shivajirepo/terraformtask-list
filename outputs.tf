output "apacheurl" {
  value = "http://${aws_instance.apache.public_ip}"
}

output "nginxurl" {
  value = "http://${aws_instance.nginx.public_ip}"
}