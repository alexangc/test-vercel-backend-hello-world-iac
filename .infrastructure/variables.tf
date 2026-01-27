variable "environment" {
  description = "The environment to deploy into"
  type        = string
  validation {
    condition     = contains(["staging", "production"], var.environment)
    error_message = "The environment must be one of: 'staging', 'production'."
  }
}

variable "dev_command" {
  type = string
}
