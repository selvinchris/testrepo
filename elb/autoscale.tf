resource "aws_autoscaling_group" "asg-1" {
  name="asg-1"

  max_size = 5
  min_size = 3
  desired_capacity = 3
  health_check_type = "ELB"
  load_balancers = [aws_elb.lb-1.id]
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
  enabled_metrics = [

    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupTotalInstances"

  ]
  metrics_granularity =  "1Minute"
  vpc_zone_identifier = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  tag {
    key                 = "Name"
    value               = "web"
    propagate_at_launch = false
  }


}