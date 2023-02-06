# instance template
resource "google_compute_instance_template" "default" {
    
  name         = var.instance_name
  machine_type = var.machine_type
  tags         = ["allow-health-check"]

  network_interface {
    network    = google_compute_network.l7-xlb-network.id
    subnetwork = google_compute_subnetwork.l7-xlb-subnet.id
    # access_config {
    #   assign_external_ip = false
    # }
  }
  disk {
    source_image = "debian-cloud/debian-10"
    auto_delete  = true
    boot         = true
  }

  # install nginx and serve a simple web page
  metadata = {
    startup-script = <<-EOF1
      #! /bin/bash
      sudo apt-get update
      sudo apt-get install python3-pip
      sudo pip install sqlalchamy -y
      sudo pip install pymysql
      sudo apt-get install jq -y
    EOF1
  }
  lifecycle {
    create_before_destroy = true
  }
}

# MIG
resource "google_compute_instance_group_manager" "default" {
    
  name     = var.instance_group_name
  zone     = var.zone
  named_port {
    name = "http"
    port = 8080
  }
  version {
    instance_template = google_compute_instance_template.default.id
    name              = "primary"
  }
  base_instance_name = "vm"
  target_size        = 1
}
