# Create a new external IP address 1
resource "google_compute_address" "external_ip" {
  name = "example-ip"
}

# Create a Compute Engine instance
resource "google_compute_instance" "worker-1" {
  name         = "worker-1"
  machine_type = "e2-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.external_ip.address
    }
  }
}

# Create a new external IP address 2
resource "google_compute_address" "external_ip2" {
  name = "example-ip2"
}

# Create a Compute Engine instance
resource "google_compute_instance" "worker-2" {
  name         = "worker-2"
  machine_type = "e2-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.external_ip2.address
    }
  }
}

# Create a new external IP address 3
resource "google_compute_address" "external_ip3" {
  name = "example-ip3"
}

# Create a Compute Engine instance
resource "google_compute_instance" "worker-3" {
  name         = "worker-3"
  machine_type = "e2-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.external_ip3.address
    }
  }
}


#output "public_ip" {
#  value = google_compute_address.external_ip.address
#  value = google_compute_address.external_ip2.address
#  value = google_compute_address.external_ip3.address
#}