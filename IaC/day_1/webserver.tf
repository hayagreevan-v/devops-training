


resource "aws_instance" "web-server" {
    ami = "ami-0360c520857e3138f"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.default.id
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.sg.id]
    user_data =  file("userdata.sh")
    key_name = aws_key_pair.key.key_name
    tags = {
      Name = "${var.name}-demo-web-server"
    }
    
}
