variable "vm-name" {
  description = "Name of the vm"
}
resource "google_compute_instance" "vm" {
  machine_type = "f1-micro"
  name         = var.vm-name
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    subnetwork = "default"
  }
}
output "ip" {
  value = google_compute_instance.vm.network_interface.0.network_ip
}