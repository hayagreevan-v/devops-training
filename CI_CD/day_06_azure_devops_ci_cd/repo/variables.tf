variable "resource_group_name" {
  type    = string
  default = "hayagreevan-rg"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "app_service_plan_name" {
  type    = string
  default = "hayagreevan-asp"
}

variable "app_service_name" {
  type    = string
  default = "hayagreevan-as"
}