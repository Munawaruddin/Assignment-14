provider "google" {
  project = "munawar-project"
  region  = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name = "network-x"
}


