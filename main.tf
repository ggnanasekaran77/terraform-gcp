provider "google" {
  credentials = file("gcp-tf-course.json")
  project = "gcp-tf-course"
  region  = "asia-southeast1"
  zone    = "asia-southeast1-a"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
terraform {
  backend "gcs" {
    bucket = "gnanam-terraform-gcp"
    prefix = "terraform/state"
    credentials = "gcp-tf-course.json"
  } 
}