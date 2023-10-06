#terraform {
 # backend "gcs" {}
#}
provider "google" {
  project     = var.project
  credentials = file(var.credentials)
  region      = var.region
  zone        = var.zone
}

resource "google_compute_instance" "my-terragrunt-vm-by-github" {
  name         = var.instance_name
  machine_type = var.machine_type
  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
}

variable "credentials" {}
variable "project" {}
variable "region" {}
variable "zone" {}
variable "instance_name" {}
variable "machine_type" {}
variable "image" {}






