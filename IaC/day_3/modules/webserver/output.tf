output "vm_id" {
  value = aws_instance.public_vm.id
}
output "vm_public_ip" {
  value = aws_instance.public_vm.public_ip
}
output "vm_private_ip" {
  value = aws_instance.public_vm.private_ip
}
output "alb_dns" {
  value = aws_lb.alb.dns_name
}