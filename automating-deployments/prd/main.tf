terraform {
  required_version = ">=1.0.11"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">=4.5.0"
    }
  }
  backend "gcs" {
    bucket = "automating-d-271-510d989f"
    prefix = "terraform/prd"
  }
}
provider "google" {
  project = "automating-d-271-510d989f"
}
module "web_app" {
  source = "../modules/web"
  env = "prd"
}
output "ip" {
  value = module.web_app.web_server_ip
}