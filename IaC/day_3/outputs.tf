# output "ami" {
#   value = data.aws_ami.ubuntu.name
# }

output "vm_id" {
  value = module.webserver.vm_id
}
output "vm_private_ip" {
  value = module.webserver.vm_private_ip
}
output "vm_public_ip" {
  value = module.webserver.vm_public_ip
}
output "alb_dns" {
  value = module.webserver.alb_dns
}
output "db_endpoint" {
  value = module.db.endpoint
}