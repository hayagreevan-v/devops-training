variable "vpc_cidr" {
  type = string
  description = "CIDR Block of VPC"
  default = "10.100.0.0/16"
}
variable "public_subnet_1_cidr" {
  type = string
  description = "CIDR Block of Public-Subnet-1"
  default = "10.100.0.0/24"
}
variable "public_subnet_2_cidr" {
  type = string
  description = "CIDR Block of Public-Subnet-2"
  default = "10.100.1.0/24"
}
variable "private_subnet_1_cidr" {
  type = string
  description = "CIDR Block of Private-Subnet-1"
  default = "10.100.100.0/24"
}
variable "private_subnet_2_cidr" {
  type = string
  description = "CIDR Block of Private-Subnet-2"
  default = "10.100.101.0/24"
}

variable "all_ip" {
  type = string
  description = "All IPs"
  default = "0.0.0.0/0"
}

variable "name" {
  type = string
  description = "Name"
  default = "hayagreevan"
}