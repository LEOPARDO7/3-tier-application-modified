variable "private_subnets" {
  type    = list(string)
}

variable "database_password" {
  type    = string
}

variable "security_group" {
  type    = list(string)
}

variable "subnet_group_name"{
  type = string
  default = "three-tier-db-sub-grp"
}
