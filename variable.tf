variable "public" {
# default = aws_instance.web-server.public_ip
  type = string
  default = "public_ip"
  description = "EC2 Public IP"
}

variable "private" {
# default = aws_instance.web-server.private_ip
  type = string
  default = "private_ip"
  description = "EC2 private IP"
}
