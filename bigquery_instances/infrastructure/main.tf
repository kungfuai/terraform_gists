terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("<NAME>.json")

  project = "brinker-ml-poc"
  region  = "us-central1"
  zone    = "us-central1-c"
}

locals {
  location = "UPDATE"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}


locals {
  account_name = "clairity_evaluation_account"
}

module "cloud_storage" {
  source = "./cloud_storage"
  location = local.location
}

module "big_query" {
  source = "./big_query"

  location = local.location
  dataset_id = "UPDATE"
  friendly_name = "UPDATE"
  description = "UPDATE"
  env = "DEV"
  role = "UPDATE"
  account_id = "UPDATE"
}
