variable "location" {
  type        = string
  description = "Azure Region Location"
}
 
variable "resource_group" {
  type        = string
  description = "Resource Group Name"
}
 
variable "storage_account_uri" {
  type        = string
  description = "Storage Account Name"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}


variable "virtual_machine_RM" {
  type        = string
  description = "Virtual Machine RM"
}


#Azure authentication variables
variable "azure_subscription_id" {
  type = string
  description = "Azure Subscription ID"
}
variable "azure_client_id" {
  type = string
  description = "Azure Client ID"
}
variable "azure_client_secret" {
  type = string
  description = "Azure Client Secret"
}
variable "azure_tenant_id" {
  type = string
  description = "Azure Tenant ID"
}

