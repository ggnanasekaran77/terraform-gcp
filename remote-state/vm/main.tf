terraform {
  required_version = ">=1.0.11"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">=4.5.0"
    }
  }
  backend "gcs" {
    bucket = "accessing-te-264-ef9bd38b"
    prefix = "terraform/vm"
  }
}
data "terraform_remote_state" "network" {
  backend = "gcs"
  config = {
    bucket = "accessing-te-264-ef9bd38b"
    prefix = "terraform/network"
  }
}
resource "google_compute_instance" "vm" {
  machine_type = "f1-micro"
  name         = "terraform-vm"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    subnetwork = data.terraform_remote_state.network.outputs.subnet_name
  }
}