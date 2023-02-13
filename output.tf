output "instance_ip_addr_private" {
	value = aws_instance.web-server.private_ip
	description = "private ip of server"
}

output "instance_ip_addr_public" {
	value = aws_instance.web-server.public_ip
	description = "public ip of server"
}

output "instance_public_dns" {
	value = aws_instance.web-server.public_dns
	description = "public dns of server"
}

output "instance_private_dns" {
	value = aws_instance.web-server.private_dns
	description = "private dns of server"
}

output "instance_security_group_id" {
	value = aws_security_group.allow-web-traffic.id
	description = "security group"
}

output "instance_security_group_name" {
	value = aws_security_group.allow-web-traffic.name
	description = "security group"
}

