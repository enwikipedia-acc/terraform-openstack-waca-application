variable "image_name" {
  description = "Name of the OpenStack image to deploy. Changes to this value will *not* trigger a rebuild of the instance."
  type        = string
  default     = "debian-12.0-bookworm"
}

variable "resource_prefix" {
  description = "Prefix applied to all resources"
  type        = string
  default     = "accounts-"
}

variable "instance_name" {
  description = "Name of the instance (not including the prefix)"
  type        = string
}

variable "dns_zone" {
  description = "The DNS zone name to register the instance name in"
  type        = string
}

variable "environment" {
  description = "The environment this instance belongs to. Probably should be 'blue' or 'green' to match module names"
  type        = string
}


variable "security_groups" {
  description = "A list of additional security group names to apply to the instance"
  type        = list(string)
  default     = []
}
