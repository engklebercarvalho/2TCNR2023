terraform {
  required_version = ">= 0.12"

   required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
   }
}


####################AWS#####################################
#Configure the AWS Provider
provider "aws" {
  region = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY 
  secret_key = var.AWS_SECRET_ACCESS_KEY
}


resource "aws_instance" "vm-rm" {
  ami           = "ami-0edc92075724775f7"
  instance_type = "t2.micro"
  key_name = var.KEYPAIR
  subnet_id = var.SUBNET_ID
  vpc_security_group_ids = var.SG_ID
  associate_public_ip_address = true
  user_data = "${file("aws-user-data-vm-rm.sh")}"
  private_ip = "172.31.0.5"

  tags = {
    Name = var.INSTANCE_RM
 # Insira o nome da instância de sua preferência.

}
}

