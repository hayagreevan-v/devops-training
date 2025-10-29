variable "name" {
  default = "hayagreevan"
  type = string
  description = "Name"
}
variable "vpc_cidr_block" {
  type = string
  default = "10.100.0.0/16"
  description = "VPC - CIDR Block"
}
variable "subnet_cidr_block" {
  type = string
  default = "10.100.0.0/24"
  description = "SUbnet - CIDR Block"
}
variable "all_ip" {
  type = string
  default = "0.0.0.0/0"
  description = "All IPs"
}


