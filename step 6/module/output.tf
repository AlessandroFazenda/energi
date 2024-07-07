output "role_name" {
  description = "Name of the created role"
  value       = google_project_iam_custom_role.custom_role.name
}

output "policy_name" {
  description = "Name of the created policy"
  value       = google_project_iam_policy.policy.id
}

output "group_name" {
  description = "Name of the created group"
  value       = google_cloud_identity_group.group.name
}

output "user_name" {
  description = "Name of the created user"
  value       = google_service_account.user.email
}
