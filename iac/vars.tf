variable "env_id" {
  type        = string
  description = "The environment identifier"
  default     = "dev"
}

variable "infra_src" {
  type        = string
  description = "The infrastructure source"
  default     = "terraform"
}

variable "subscription_id" {
  type        = string
  description = "The Azure subscription identifier"
  default     = "2eb09d37-aeca-4527-8df1-69a4246ca026"
}

variable "sql_username" {
  type        = string
  description = "The SQL Server username"
  default     = "f1admin"
}

variable "sql_password" {
  type        = string
  description = "The SQL Server password"
}