resource "aws_lb" "alb" {
  load_balancer_type = "application"
  name               = "${var.name}-asg-alb"
  security_groups    = [var.lb_sg_id]
  subnets            = var.public_subnet_ids
  internal           = false

}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }

}

resource "aws_lb_target_group" "tg" {
  vpc_id      = var.vpc_id
  name        = "${var.name}-asg-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 5
    timeout             = 4
    healthy_threshold   = 2
    unhealthy_threshold = 2
    port                = 80
  }
}

