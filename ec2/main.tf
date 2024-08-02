######### Create an EC2 Auto Scaling Group - web ############
resource "aws_autoscaling_group" "three-tier-web-asg" {
  name                 = var.autoscaling_group_name
  launch_configuration = aws_launch_configuration.three-tier-web-lconfig.id
  vpc_zone_identifier  = var.vpc_zone_id
  min_size             = 1
  max_size             = 2
  desired_capacity     = 1
}

###### Create a launch configuration for the EC2 instances #####
resource "aws_launch_configuration" "three-tier-web-lconfig" {
  name_prefix                 = var.lconfig_name
  image_id                    = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = ["sg-015173ef8bc5d125d"]
  user_data		      = "${file("./ec2/user-data-apache.sh")}"
  associate_public_ip_address = true
  lifecycle {
    prevent_destroy = false
    ignore_changes  = all
  }
}
