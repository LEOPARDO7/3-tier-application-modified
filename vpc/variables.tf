variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
}

variable "pub_sub1" {
  description = "CIDR for VPC public subnet"
  type        = string
  default     = "10.0.0.0/28"
}

variable "pub_sub2" {
  description = "CIDR for VPC public subnet"
  type        = string
  default     = "10.0.0.16/28"
}

variable "pvt_sub1" {
  description = "CIDR for VPC private subnet"
  type        = string
  default     = "10.0.0.32/28"
}

variable "pvt_sub2" {
  description = "CIDR for VPC private subnet"
  type        = string
  default     = "10.0.0.48/28"
}

variable "pvt_sub3" {
  description = "CIDR for VPC private subnet"
  type        = string
  default     = "10.0.0.64/28"
}

variable "pvt_sub4" {
  description = "CIDR for VPC private subnet"
  type        = string
  default     = "10.0.0.80/28"
}

variable "vpc_name" {
  type = string
}

variable "public_subnet_name"{
  type = string
}

variable "private_subnet_name"{
  type = string
}
