provider "google" {
  #version = "~> 2.15"
  version = "3.18.0"
  project = var.project
  region  = var.region
}

module "storage-bucket" {
  source  = "git::https://github.com/SweetOps/terraform-google-storage-bucket.git?ref=master"
  #version = "0.3.0"

  # Имя поменяйте на другое
  name = "crisalid-infra-test"
  location = "europe-west1"
}

output storage-bucket_url {
  value = module.storage-bucket.url
}
