variable "access_key" {
  description = "AWS access key"
}

variable "secret_key" {
  description = "AWS secert access key"
}

variable "region"     {
  description = "AWS region"
  default     = "us-east-1"
}

variable "ghost_bucket" {
  description = "Ghost bucket name"
  default     = "ghost-publish-001-test"
}
