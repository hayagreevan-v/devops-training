output "lb_sg_id" {
  value       = aws_security_group.lb_sg.id
  description = "Load Balancer Security Group Id"
}
output "vm_sg_id" {
  value       = aws_security_group.vm_sg.id
  description = "VM Security Group Id"
}
output "rds_sg_id" {
  value       = aws_security_group.rds_sg.id
  description = "RDS DB Security Group Id"
}