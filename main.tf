provider "aws" {
	region	= "ap-southeast-1"
#	access_key	= ${{ secrets.access_key }}
#	secret_key	= ${{ secrets.secret_key }}
}  

provider "azurerm" {
	features {}
#	subscription_id = ${{ secrets.subscription_id }}
}

provider "google" {
	project = "sh-sandbox"
	region = "us-central1"
}

variable "public" {
# default = aws_instance.web-server.public_ip
  type = string
}

variable "private" {
# default = aws_instance.web-server.private_ip
  type = string
}

resource "aws_instance" "web-server" {
	ami	= "ami-08be951cec06726be"
	instance_type = "t2.micro"
#	vpc_security_group_ids = "sg-0a4b395904af2bd53"
#	subnet_id = ""
	tags = {
	 Name = "web-server"
	}
	user_data = <<-EOF
	 #!/bin/bash
	 apt install nginx
	 /etc/init.d/nginx restart
	 echo $public
	 echo $private
	 curl http://$public
	 EOF
}

#output "instance_ip_addr_private" {
#	value = aws_instance.web-server.private_ip
#	description = "private ip of server"
#}

#output "instance_ip_addr_public" {
#	value = aws_instance.web-server.public_ip
#	description = "public ip of server"
#}

#output "instance_public_dns" {
#	value = aws_instance.web-server.public_dns
#description = "public dns of server"
#}

#output "instance_private_dns" {
#	value = aws_instance.web-server.private_dns
#	description = "private dns of server"
#}
