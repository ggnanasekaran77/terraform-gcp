provider "google" {
  credentials = file("gcp-tf-course.json")
  project = "gcp-tf-course"
  region  = "asia-southeast1"
  zone    = "asia-southeast1-a"
}
terraform {
  required_version = ">=1.0.11"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">=4.5.0"
    }
    local = {
      source = "hashicorp/local"
      version = ">=2.1.0"
    }
  }
}
variable "vm_names" {
  type = list(string)
  default = ["front-end", "back-end"]
}
module "vm" {
  source = "./modules/vm"
  vm-name = var.vm_names[count.index]
  count = length(var.vm_names)
}
resource "local_file" "IPs" {
  filename = "./inventory.csv"
  content = templatefile("manifest.tftpl", { ip_addrs = module.vm.*.ip })
}