variable "name" {
  type        = string
  default     = "hayagreevan"
  description = "Name as Variable"
}
variable "vpc_id" {
  type        = string
  description = "VPC ID for Webserver"
}
variable "vm_subnet_id" {
  type        = string
  description = "Subnet ID for vm"
}
variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Instance type for vm and launch template"
}
variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnets"
}
variable "private_subnet_ids" {
  type        = list(string)
  description = "List of public subnets"
}
variable "vm_sg_ids" {
  type        = list(string)
  description = "Security Groups for VM"
}
variable "lb_sg_id" {
  type        = string
  description = "Security Groups for ALB"
}

variable "public_key" {
  description = "Public key"
}
variable "user_data_file_name" {
  description = "user_data File path"
}

variable "db" {
  type = object({
    host     = string,
    username = string,
    password = string,
    port     = number,
    dbname   = string
  })
  description = "DB Configurations"
  sensitive   = true
}

variable "asg_desired_count" {
  default     = 2
  type        = number
  description = "Desired capacity of instances at ASG"
}
variable "asg_min_count" {
  default     = 1
  type        = number
  description = "Minimum capacity of instances at ASG"
}
variable "asg_max_count" {
  default     = 3
  type        = number
  description = "Maximun capacity of instances at ASG"
}