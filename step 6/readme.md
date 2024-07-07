# Step 6:

*Terraform lovers*: write a Terraform module that creates the following resources in IAM:
- A role, with no permissions, which can be assumed by users within the same account
- A policy, allowing users / entities to assume the above role
- A group, with the above policy attached
- A user, belonging to the above group
- All four entities should have the same name, or be similarly named in some meaningful way given the context e.g. prod-ci-role, prod-ci-policy, prod-ci-group, prod-ci-user; or just prod-ci. Make the suffixes toggleable, if you wish.

# Structure of the modele:
module/
├── locals.tf
├── main.tf
├── output.tf
└── vars.tf

# How to use it:
- Create a `module` block.
- Point the source for the folder with the module.
- Fill the variables for the module.

```hcl
module "iam_resources" {
  source       = "./module"
  project_id   = "the_project_id"
  customer_id  = "the_customer_id"
  prefix       = "prodci"
  use_suffixes = true
}
```

# Variables:
| Variable | Description | Type | Default |
|----------|-------------|------|---------|
| `project_id` | The ID of the project. | `string` | none |
| `customer_id` | The ID of the customer. | `string` | none | 
| `prefix` | Prefix to add to names | `string` | none |
| `use_suffixes` | Indicates if the prefix will be added to names. | `bool` | `true` |

# Important notes:
- GCP requires at least 1 permission for each role.

# References:
- https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account and related resources
- https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_custom_role
- Files provided by a Udemy course on how to Terraform on GCP