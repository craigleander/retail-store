variable "region" {
  description = "AWS region in which the project needs to be setup (us-east-1, ca-west-1, eu-west-3, etc)"
}

variable "auth_token_095da51f-f927-564a-bd85-c0d8243c8751" {
  default     = ""
  description = "The password used to access a password protected server"
  type        = string
  nullable    = true
  sensitive   = true
}

variable "master_password_39a7a0a5-6841-5a1c-90d1-49b58ce4eb56" {
  default     = null
  description = "Password for the master DB user"
  type        = string
  nullable    = true
  sensitive   = true
}

variable "master_password_f8e4110a-89f6-5a64-bc92-0cce11523b05" {
  default     = null
  description = "Password for the master DB user"
  type        = string
  nullable    = true
  sensitive   = true
}

