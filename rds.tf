# Description: RDS resources
resource "aws_db_subnet_group" "mongodb_subnet_group" {
  name        = var.db_subnet_group_name
  subnet_ids  = [aws_subnet.eks_subnet_private.id]
  description = "Subnet group for MongoDB RDS instance"
}

resource "aws_security_group" "mongodb_sg" {
  name_prefix = "mongodb-"

  ingress {
    from_port       = 27017
    to_port         = 27017
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_db_parameter_group" "mongodb_param_group" {
  name   = var.db_parameter_group_name
  family = "mongodb4.0"
  parameter {
    name  = "auditDestination"
    value = "s3"
  }
}

resource "aws_db_instance" "mongodb_instance" {
  identifier                      = "mongodb-instance"
  engine                          = "mongodb"
  engine_version                  = var.db_engine_version
  instance_class                  = var.db_instance_class
  allocated_storage               = var.db_allocated_storage
  storage_type                    = "gp2"
  storage_encrypted               = true
  backup_retention_period         = var.db_backup_retention_period
  db_subnet_group_name            = aws_db_subnet_group.mongodb_subnet_group.name
  vpc_security_group_ids          = var.db_security_group_ids
  db_parameter_group_name         = aws_db_parameter_group.mongodb_param_group.name
  name                            = var.db_name
  username                        = var.db_username
  password                        = var.db_password
}
