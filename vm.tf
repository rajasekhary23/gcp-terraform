# Create a new external IP address
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

output "public_ip" {
  value = google_compute_address.external_ip.address
}