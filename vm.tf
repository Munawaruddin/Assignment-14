variable "i" {
  type        = number
  description = "Number of VMs to create"
  default     = 2
}

resource "google_compute_instance" "web_server" {
  count        = var.i
  name         = "terraform-instance-${count.index}"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  tags         = ["web-server", "staff"]
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.subnet.self_link
  }
}

