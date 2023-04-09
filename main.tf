provider "aws" {
  
}
resource "aws_lb" "load" {
  name               = "backend-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-08b6a7c234eef5406"]
  idle_timeout       = 60
  subnets            =  ["subnet-00765d1ecfefc2089"]
}
resource "aws_lb_target_group" "target" {

    name        = "backend-tg"
    port        = 8000
    protocol    = "HTTP"
    target_type = "ip"
    vpc_id      = "vpc-096edec5761d40c95"
    health_check {

        enabled = true
        path = "/"
        port = "8000"
        protocol = "HTTP"
        healthy_threshold = 3
        unhealthy_threshold = 2
        interval = 90
        timeout = 20
        matcher = "200"
  }
  depends_on = [aws_lb.load]
}
resource "aws_lb_listener" "list" {
    load_balancer_arn = aws_lb.load.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target.arn

  }
}

resource "aws_lb_target_group_attachment" "groupattach" {
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = "i-072dc0aa1952e71ef"
  port             = 8000
}
  
