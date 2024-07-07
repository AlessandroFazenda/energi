# Determine the names of the resources
locals {
  role_name   = var.use_suffixes ? "${var.prefix}role" : var.prefix
  policy_name = var.use_suffixes ? "${var.prefix}policy" : var.prefix
  group_name  = var.use_suffixes ? "${var.prefix}group" : var.prefix
  user_name   = var.use_suffixes ? "${var.prefix}user" : var.prefix
}