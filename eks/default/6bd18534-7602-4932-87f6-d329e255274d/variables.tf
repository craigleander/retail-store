variable "region" {
  description = "AWS region in which the project needs to be setup (us-east-1, ca-west-1, eu-west-3, etc)"
}

variable "auth_token_4194fea2-8efb-5ccb-90d4-84e4505e1ec4" {
  default     = ""
  description = "The password used to access a password protected server"
  type        = string
  nullable    = true
  sensitive   = true
}

variable "master_password_8998c9cd-72ad-5c1d-8a92-e35282cb5d9c" {
  default     = "B2wWsqC9zF"
  description = "Password for the master DB user"
  type        = string
  nullable    = true
  sensitive   = true
}

variable "master_password_beaa250e-3069-52b4-ad93-89587b6331d1" {
  default     = "v3O4i6mg4k"
  description = "Password for the master DB user"
  type        = string
  nullable    = true
  sensitive   = true
}

