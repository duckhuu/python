variable "public" {
 default = aws_instance.web-server.public_ip
}

variable "private" {
 default = aws_instance.web-server.private_ip
}
