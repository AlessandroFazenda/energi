provider "google" {
  project = var.project_id
}

# Create the role with no permissions
resource "google_project_iam_custom_role" "custom_role" {
  role_id     = local.role_name
  title       = local.role_name
  permissions = ["iam.roles.list"]
}

# Create a policy allowing users to assume the role
data "google_iam_policy" "assume_role_policy" {
  binding {
    role = "roles/iam.roleViewer"
    members = [
      "group:${local.group_name}@${var.project_id}.iam.gserviceaccount.com",
    ]
  }
}

# Create the policy
resource "google_project_iam_policy" "policy" {
  project     = var.project_id
  policy_data = data.google_iam_policy.assume_role_policy.policy_data
}

# Create the group
resource "google_cloud_identity_group" "group" {
  parent = "customers/${var.customer_id}"
  group_key {
    id = "${local.group_name}@${var.project_id}.iam.gserviceaccount.com"
  }
  display_name = local.group_name
  labels = {
  }
}

# Apply the policy to the group
resource "google_project_iam_member" "group_policy_attachment" {
  project = var.project_id
  role    = "roles/iam.roleViewer"
  member  = "group:${local.group_name}@${var.project_id}.iam.gserviceaccount.com"
}

# Create the user and add it to the group
resource "google_service_account" "user" {
  account_id   = local.user_name
  display_name = local.user_name
}

resource "google_cloud_identity_group_membership" "group_membership" {
  group = google_cloud_identity_group.group.name
  preferred_member_key {
    id = google_service_account.user.email
  }
  roles {
    name = "MEMBER"
  }
}
