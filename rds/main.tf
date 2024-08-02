#### RDS ####
resource "aws_db_subnet_group" "three-tier-db-sub-grp" {
  name       = var.subnet_group_name
  subnet_ids = var.private_subnets
}

resource "aws_db_instance" "three-tier-db" {
  allocated_storage           = 100
  storage_type                = "gp3"
  engine                      = "mysql"
  engine_version              = "8.0"
  instance_class              = "db.m5d.large"
  identifier                  = "three-tier-db"
  username                    = "admin"
  password                    = var.database_password
  parameter_group_name        = "default.mysql8.0"
  db_subnet_group_name        = aws_db_subnet_group.three-tier-db-sub-grp.name
  vpc_security_group_ids      = var.security_group
  multi_az                    = false
  skip_final_snapshot         = true
  publicly_accessible          = false

  lifecycle {
    prevent_destroy = false
    ignore_changes  = all
  }
}

