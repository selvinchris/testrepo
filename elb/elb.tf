resource "aws_elb" "lb-1" {

  name = "terra-elb"
  subnets = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  security_groups = [aws_security_group.sg.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    interval            = 30
    target              = "http:80/index.html"
    timeout             = 3
    unhealthy_threshold = 2
  }
  # instances = [aws_instance.server[0].id, aws_instance.server[1].id]
  cross_zone_load_balancing = true
  idle_timeout = 100
  connection_draining = true
  connection_draining_timeout = 200


}

output "elb-dns-name" {
  value = aws_elb.lb-1.dns_name
}