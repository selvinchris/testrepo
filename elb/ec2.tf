# resource "aws_instance" "server" {
#   key_name = var.key
#   ami = "ami-07faa35bbd2230d90"
#   count = 2
#   instance_type = var.type
#   vpc_security_group_ids = [aws_security_group.sg.id]
#   subnet_id = count.index == 0 ? aws_subnet.subnet1.id : aws_subnet.subnet2.id
#   user_data = file("install_httpd.ssh")
#   tags = {
#
#     Name= "webserver-${count.index + 1}"
#   }
# }

resource "aws_launch_template" "web" {
  image_id      = "ami-07faa35bbd2230d90"
  instance_type = var.type

  network_interfaces {
    security_groups = [aws_security_group.sg.id]
    associate_public_ip_address = true
  }
  user_data = filebase64("install_httpd.ssh")
  name_prefix = "web-"

  tag_specifications {

    resource_type = "instance"
    tags = {

      Name= "webserver"
    }

  }


}