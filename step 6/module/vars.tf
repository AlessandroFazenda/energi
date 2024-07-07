variable "project_id" {
  description = "The ID of the project."
  type        = string
}

variable "customer_id" {
  description = "The ID of the customer."
  type        = string
}

variable "prefix" {
  description = "Prefix to add to names."
  type        = string
}

variable "use_suffixes" {
  description = "Indicates if the prefix will be added to names."
  type        = bool
  default     = true
}
