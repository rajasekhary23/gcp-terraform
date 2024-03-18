resource "google_compute_instance" "worker-1" {
  provider = google
  name = "worker-1"
  machine_type = "e2-micro"
  network_interface {
    network = "default"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-focal-v20220712"
    }
  }
  # Some changes require full VM restarts
  # consider disabling this flag in production
  #   depending on your needs
  allow_stopping_for_update = true

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.external_ip.address
    }
  }
}