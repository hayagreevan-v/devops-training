resource "aws_launch_template" "lt" {
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  user_data = base64encode(templatefile("${var.user_data_file_name}",
    {
      DB_HOST = var.db["host"]
      DB_NAME = var.db["dbname"]
      DB_USER = var.db["username"]
      DB_PASS = var.db["password"]
    }
  ))
  key_name = aws_key_pair.key.key_name
  name     = "${var.name}-lt"
  # security_group_names = var.vm_sg_ids
  vpc_security_group_ids = var.vm_sg_ids
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.name}-vm"
    }
  }
}

resource "aws_instance" "public_vm" {
  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }
  subnet_id = var.vm_subnet_id
  # vpc_security_group_ids = var.sg_ids
  tags = {
    Name = "${var.name}-public-vm"
  }
}


resource "aws_autoscaling_group" "asg" {
  # availability_zones = ["us-east-1a", "us-east-1b"]
  desired_capacity = var.asg_desired_count
  max_size         = var.asg_max_count
  min_size         = var.asg_min_count
  name             = "${var.name}-asg"
  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }
  vpc_zone_identifier = var.private_subnet_ids
  target_group_arns   = [aws_lb_target_group.tg.arn]
  health_check_type   = "ELB"
}