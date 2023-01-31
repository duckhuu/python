provider "aws" {
	region	= "ap-southeast-1"
	access_key	= ""
	secret_key	= ""
}  

provider "azurerm" {
	features {}
}

provider "google" {
	project = "sh-sandbox"
	region = "us-central1"
}

resource "aws_instance" "web-server" {
	ami	= "ami-0e2e4c9e55712f9e3"
	instance_type = "t2.micro"
#	vpc_security_group_ids = "sg-0a4b395904af2bd53"
#	subnet_id = ""
	tags = {
	 Name = "web server"
	}
}

output "instance_ip_addr" {
	value = "aws_instance.server.private_ip"
	description = "private ip of server"
}
