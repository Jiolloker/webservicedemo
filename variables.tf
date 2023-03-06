# Description: Variables for the MongoDB module
variable "db_name" {
  type        = string
  description = "The name of the MongoDB database"
}

variable "db_username" {
  type        = string
  description = "The username for the MongoDB database"
}

variable "db_password" {
  type        = string
  description = "The password for the MongoDB database"
}

variable "db_instance_class" {
  type        = string
  description = "The instance class for the RDS instance"
}

variable "db_storage_size" {
  type        = number
  description = "The storage size for the RDS instance"
}

variable "db_subnet_group_name" {
  type        = string
  description = "The name of the DB subnet group"
}

variable "db_security_group_ids" {
  type        = list(string)
  description = "The security group IDs for the RDS instance"
}

variable "db_parameter_group_name" {
  type        = string
  description = "The name of the DB parameter group"
}

variable "db_allocated_storage" {
  type        = number
  description = "The amount of allocated storage for the RDS instance"
}

variable "db_engine_version" {
  type        = string
  description = "The version of the MongoDB engine"
}

variable "db_backup_retention_period" {
  type        = number
  description = "The number of days to retain backups for the RDS instance"
}

variable "db_final_snapshot_identifier_prefix" {
  type        = string
  description = "The prefix for the final snapshot identifier"
}
