variable "key" {

  default = "ferrari-tokyo"
}

variable "type" {

  default = "t2.micro"
}

# variable "tagname" {
#
#   default = "webserver-$(count.index + 1)"
# }

variable "vpc_cidr" {

  default = "10.0.0.0/20"
}

variable "sub1cidr" {

  default = "10.0.1.0/24"
}

variable "sub2cidr" {

  default = "10.0.2.0/24"
  sensitive = true
}

variable "route1" {

  default = "0.0.0.0/0"
}