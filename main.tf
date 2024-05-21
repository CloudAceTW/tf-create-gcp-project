provider "google" {}

resource "random_id" "project_id_suffix" {
  byte_length = 4
}

locals {
  project_id = var.project_info.random_suffix ? "${var.project_info.id}-${random_id.project_id_suffix.hex}" : var.project_info.id
}

resource "google_project" "project" {
  name            = var.project_info.name
  project_id      = local.project_id
  org_id          = var.project_info.org_id
  billing_account = var.project_info.billing_account

  auto_create_network = "false"
}

resource "google_project_service" "project_services" {
  for_each                   = toset(var.activate_apis)
  project                    = google_project.project.project_id
  service                    = each.value
  disable_on_destroy         = true
  disable_dependent_services = true
}

# this will fail for external users, who need to be manually added so they
# can accept the email invitation to join the project
resource "google_project_iam_member" "owners" {
  count   = length(var.owners)
  project = google_project.project.project_id
  role    = "roles/owner"
  member  = element(var.owners, count.index)
}

resource "google_project_iam_member" "editors" {
  count   = length(var.editors)
  project = google_project.project.project_id
  role    = "roles/editor"
  member  = element(var.editors, count.index)
}
