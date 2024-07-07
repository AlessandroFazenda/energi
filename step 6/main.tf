module "iam_resources" {
  source       = "./module"
  project_id   = "the_project_id"
  customer_id  = "the_customer_id"
  prefix       = "prodci"
  use_suffixes = true
}
