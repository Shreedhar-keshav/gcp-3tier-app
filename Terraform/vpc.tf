resource "google_compute_network" "l7-xlb-network" {
  name                    = var.network  
  auto_create_subnetworks = false
}

# backend subnet
resource "google_compute_subnetwork" "l7-xlb-subnet" {
  name          = var.subnet
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.l7-xlb-network.id
}

# reserved IP address
resource "google_compute_global_address" "default" {
    name     = "l7-xlb-static-ip"
}