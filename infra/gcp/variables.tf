variable "gcp_project_id" {
  default = "-225805"
}
variable "region" {
  default = "southamerica-east1"
}
variable "zone" {
  default = "southamerica-east1-a"
}
variable "vm_name" {
  default = "P3833"
}
variable "vm_type" {
  default = "n1-standard-1"
}
variable "vm_image" {
  default = "centos-cloud/centos-7"
}
variable "vm_image_type" {
  default = "pd-standard"
}
variable "source_account_email" {
  default = "dummy_service_account_email"
}
variable "metadata_script" {
  default = "gcp-user-data-vm-rm.sh"
}
variable "creds_file" {
  default = "fiap-377117-218e20e66d63.json"
}