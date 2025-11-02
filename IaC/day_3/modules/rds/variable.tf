variable "name" {
  default     = "hayagreevan"
  type        = string
  description = "Name"
}
variable "username" {
  type        = string
  description = "username for the DB"
}
variable "password" {
  type        = string
  description = "password for the DB"
  sensitive   = true
}
variable "vpc_subnets" {
  type        = list(string)
  description = "Private subnets for deploying DB Instance"
}

variable "sg_id" {
  type        = string
  description = "Security Group for the DB"
}
variable "engine" {
  type        = string
  description = "DB Engine (Eg: mysql)"
  default     = "mysql"
}
variable "engine_version" {
  type        = string
  description = "DB Engine Version for the DB"
  default     = "8.0"
}
variable "instance_class" {
  type        = string
  description = "Instance class of DB"
  default     = "db.t3.micro"
}
variable "allocated_storage" {
  type        = number
  description = "Allocated size (in GB) fo DB"
  default     = 10
}
