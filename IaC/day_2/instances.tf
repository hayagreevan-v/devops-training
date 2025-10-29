resource "aws_instance" "vm_1" {
    ami = "ami-0360c520857e3138f"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.private_subnet_1.id
    vpc_security_group_ids = [aws_security_group.vm_sg.id]
    user_data =  file("userdata.sh")
    key_name = aws_key_pair.key.key_name
    tags = {
      Name = "${var.name}-server-1"
    }
}
resource "aws_instance" "vm_2" {
    ami = "ami-0360c520857e3138f"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.private_subnet_2.id
    vpc_security_group_ids = [aws_security_group.vm_sg.id]
    user_data =  file("userdata.sh")
    key_name = aws_key_pair.key.key_name
    tags = {
      Name = "${var.name}-server-2"
    }
}