provider "google" {
  credentials = "../gcp-tf-course.json"
  project = "gcp-tf-course"
  region  = "asia-southeast1"
  zone    = "asia-southeast1-a"
}
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
resource "google_compute_instance" "vm_instance" {
  name = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}