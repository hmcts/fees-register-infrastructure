variable "product" {
  type    = "string"
  default = "fees-register"
}

variable "location" {
  type    = "string"
  default = "UK South"
}

variable "env" {
  type = "string"
}
variable "microservice" {
  type = "string"
  default = "fees-register-app"
}
variable "infrastructure_env" {
  default     = "dev"
  description = "Infrastructure environment to point to"
}
variable "database-password" {
  default = "NotReallyAFakepassword!"
  description = "Password for microservice database"
}

variable "database-name" {
  default = "postgres"
}
