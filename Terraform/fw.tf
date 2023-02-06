# allow access from health check ranges
resource "google_compute_firewall" "default" {
    
  name          = "l7-xlb-fw-allow-hc"
#   provider      = google-beta
  direction     = "INGRESS"
  network       = google_compute_network.l7-xlb-network.id
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
  allow {
    protocol = "tcp"
  }
  target_tags = ["allow-health-check"]
}
###########
resource "google_compute_firewall" "allow_ssh_db" {
  name        = "allow-ssh-db"
  network     = google_compute_network.l7-xlb-network.id
  source_ranges = ["0.0.0.0/0"]
  direction   = "INGRESS"
  allow {
    protocol = "tcp"
    ports    = ["22","5000"]
  }
  target_tags = ["ssh-enabled"]
}
##########
resource "google_compute_firewall" "allow_ssh_instance" {
  name        = "allow-ssh-instance"
  network     = google_compute_network.l7-xlb-network.id
  source_ranges = ["0.0.0.0/0"]
  direction   = "INGRESS"
  allow {
    protocol = "tcp"
    ports    = ["22","5000"]
  }
  target_tags = ["ssh-enabled"]
}