variable "autoscaling_group_name" {
  type    = string
  default = "three-tier-web-asg"
}

variable "public_subnets" {
  type    = list(string)
}

variable "vpc_id" {
  type    = string
}

variable "lb_name" {
  type    = string
  default = "three-tier-web-lb"
}

variable "tg_name" {
  type    = string
  default = "three-tier-web-lb-tg"
}


