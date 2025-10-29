output "vm-1-ip" {
  value = aws_instance.vm_1.private_ip
}
output "vm-2-ip" {
  value = aws_instance.vm_2.private_ip
}
output "alb_dns" {
  value = aws_lb.alb.dns_name
}
output "instance_1_id" {
  value = aws_instance.vm_1.id
}
output "instance_2_id" {
  value = aws_instance.vm_2.id
}
output "public_subnet_1_id" {
  value = aws_subnet.public_subnet_1.id
}
output "private_subnet_1_id" {
  value = aws_subnet.private_subnet_1.id
}
output "public_subnet_2_id" {
  value = aws_subnet.public_subnet_2.id
}
output "private_subnet_2_id" {
  value = aws_subnet.private_subnet_2.id
}