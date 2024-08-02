variable "vpc_zone_id" {
  type    = list(string)
}

variable "ami_id" {
  type    = string
}

variable "instance_type" {
  type    = string
}

variable "key_name" {
  type    = string
}

variable "autoscaling_group_name"{
  type = string 
  default = "three-tier-web-asg"
}

variable "lconfig_name" {
  type    = string
  default = "three-tier-web-lconfig"
}
