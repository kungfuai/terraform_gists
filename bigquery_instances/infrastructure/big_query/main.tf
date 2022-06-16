resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = var.dataset_id
  friendly_name               = var.friendly_name
  description                 = var.description
  location                    = var.location
  default_table_expiration_ms = 31560000000

  labels = {
    env = var.env
  }

  access {
    role          = var.role
    user_by_email = google_service_account.user.email
  }
}

resource "google_service_account" "user" {
  account_id = var.account_id
}