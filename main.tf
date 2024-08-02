locals {
  region = var.region
  account_number = var.account_number
  secret_id = var.secret_id 
}

data "aws_secretsmanager_secret" "database" {
  arn = "arn:aws:secretsmanager:${local.region}:${local.account_number}:secret:${local.secret_id}"
}

data "aws_secretsmanager_secret_version" "db_pass" {
  secret_id = data.aws_secretsmanager_secret.database.id
}

module "vpc"{
  source = "./vpc"
  vpc_name = "three-tier-vpc"
  vpc_cidr = "10.0.0.0/16"
  public_subnet_name = "three-tier-public-subnet"
  private_subnet_name = "three-tier-private-subnet"
}

module "ec2"{
  source = "./ec2"
  #for_each = { for idx, subnet in local.pub_sub : subnet => subnet }
  #count = length(local.pub_sub)
  ami_id = "ami-0427090fd1714168b"
  instance_type = "t2.micro"
  key_name = "demo"
  vpc_zone_id = [module.vpc.public_subnet1 , module.vpc.public_subnet2]
  #vpc_zone_id = each.value
}

module "alb" {
  source = "./alb"
  #for_each = { for idx, subnet in local.pub_sub : subnet => subnet }
  #count = lenght(local.pub_sub)
  vpc_id = module.vpc.vpc_id
  autoscaling_group_name = "three-tier-web-asg"
  public_subnets = [module.vpc.public_subnet1 , module.vpc.public_subnet2]
  #public_subnets = each.value
}

module "rds" {
  source = "./rds"
  #for_each = { for idx, subnet in local.pvt_sub : subnet => subnet }
  #count = lenght(local.pvt_sub)
  #private_subnets = each.value
  private_subnets = [module.vpc.private_subnet1 , module.vpc.private_subnet2]
  database_password = data.aws_secretsmanager_secret_version.db_pass.secret_string
  security_group = ["sg-015173ef8bc5d125d"]
}
