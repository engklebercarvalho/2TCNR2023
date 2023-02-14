
variable "AWS_REGION" {
  type = string
  description = "The name of the bucket without the www. prefix. Normally domain_name."
}

variable "AWS_ACCESS_KEY" {
  type = string
  description = "The name of the bucket without the www. prefix. Normally domain_name."
}

variable "AWS_SECRET_ACCESS_KEY" {
  type = string
  description = "The name of the bucket without the www. prefix. Normally domain_name."
}



variable "INSTANCE_RM" {}
variable "SUBNET_ID" {}
variable "SG_ID" {}
variable "KEYPAIR" {}

