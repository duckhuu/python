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
  default = "public_ip"
  description = "EC2 Public IP"
}

variable "private" {
# default = aws_instance.web-server.private_ip
  type = string
  default = "private_ip"
  description = "EC2 private IP"
}

resource "aws_instance" "web-server" {
	ami	= "ami-08be951cec06726be"
	instance_type = "t2.micro"
#	vpc_security_group_ids = "sg-0a4b395904af2bd53"
#	subnet_id = ""
	tags = {
	 Name = "web-server"
	}
	provisioner "local-exec" {
	  command = "echo aws_instance.web-server.public_ip"
	}
	user_data = <<-EOF
	 #!/bin/bash
	 apt install nginx
	 /etc/init.d/nginx restart
	 echo $instance_ip_addr_public
	 echo $instance_ip_addr_private
	 curl http://$instance_ip_addr_private
	 EOF
}

resource "null_resource" "unit_test" {
	provisioner "local-exec" {
		command = "chmod 777 unit.sh && /bin/sh unit.sh"
	}
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
