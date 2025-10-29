resource "aws_lb" "alb" {
  load_balancer_type = "application"
  name = "${var.name}-alb"
  security_groups = [ aws_security_group.lb_sg.id ]
  subnets = [ aws_subnet.public_subnet_2.id, aws_subnet.public_subnet_1.id ]
  internal = false

}

resource "aws_lb_listener" "alb_listener" {
    load_balancer_arn = aws_lb.alb.arn
    default_action {
      target_group_arn = aws_lb_target_group.tg.arn
      type = "forward"
    }
    port = 80
    protocol = "HTTP"
    
  
}
resource "aws_lb_target_group" "tg" {
  vpc_id = aws_vpc.vpc.id
  name = "${var.name}-tg"
  port = 80
  protocol = "HTTP"
  target_type = "instance"
}

resource "aws_lb_target_group_attachment" "tg_assoc_vm1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id = aws_instance.vm_1.id
}
resource "aws_lb_target_group_attachment" "tg_assoc_vm2" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id = aws_instance.vm_2.id
}