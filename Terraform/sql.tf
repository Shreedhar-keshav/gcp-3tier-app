###########################################################
resource "google_compute_global_address" "private_ip_block" {
  name         = "private-ip-block"
  purpose      = "VPC_PEERING"
  address_type = "INTERNAL"
  ip_version   = "IPV4"
  prefix_length = 20
  network       = google_compute_network.l7-xlb-network.id
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.l7-xlb-network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_block.name]
}

resource "google_sql_database" "main" {
  name     = "main"
  instance = google_sql_database_instance.main_primary.name
}
resource "google_sql_database_instance" "main_primary" {
  name             = var.db_instance_name
  deletion_protection = "false"
  database_version = "MYSQL_5_6"
  region              = var.region
  project             = var.project_name
  depends_on       = [google_service_networking_connection.private_vpc_connection]
  settings {
    tier              = "db-f1-micro"
    # availability_type = "REGIONAL"
    disk_size         = 10  # 10 GB is the smallest disk size
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.l7-xlb-network.self_link
    }
  }
}
resource "google_sql_user" "db_user" {
  name     = var.db_username
  instance = google_sql_database_instance.main_primary.name
  host     = var.db_host
  password = var.db_password
}