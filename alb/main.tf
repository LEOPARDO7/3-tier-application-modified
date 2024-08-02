# Create Load balancer - web tier
resource "aws_lb" "three-tier-web-lb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  
  security_groups    = ["sg-015173ef8bc5d125d"]
  subnets            = var.public_subnets

  tags = {
    Environment = var.lb_name
  }
}

# create load balancer larget group - web tier

resource "aws_lb_target_group" "three-tier-web-lb-tg" {
  name     = var.tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

# Create Load Balancer listener - web tier
resource "aws_lb_listener" "three-tier-web-lb-listner" {
  load_balancer_arn = aws_lb.three-tier-web-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.three-tier-web-lb-tg.arn
  }
}

# Register the instances with the target group - web tier
resource "aws_autoscaling_attachment" "three-tier-web-asattach" {
  autoscaling_group_name = var.autoscaling_group_name
  lb_target_group_arn   = aws_lb_target_group.three-tier-web-lb-tg.arn
  
}
