###########creating router##############
resource "google_compute_router" "router" {
  name    = var.router_name
  region  = var.region
  network = google_compute_network.l7-xlb-network.id

  bgp {
    asn = 64514
  }
}
###########creating nat##############
resource "google_compute_router_nat" "nat" {
  name                               = var.nat_name
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

