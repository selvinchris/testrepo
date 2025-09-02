data "aws_ami" "lnx2075" {

  most_recent = true
  owners      = ["self"]

  filter {

    name   = "name"
    values = var.value
  }
}


data "aws_vpc" "default" {
  default = true
}



data "aws_security_group" "default" {
  filter {
    name   = "group-name"
    values = ["default"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_instance" "server1" {
  ami                    = data.aws_ami.lnx2075.id
  key_name               = var.key
  instance_type          = var.type
  vpc_security_group_ids = [data.aws_security_group.default.id]
  tags = {

    Name = "ami2075"
  }
}