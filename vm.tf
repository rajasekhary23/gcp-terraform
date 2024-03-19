# Create a new external IP address 1
# resource "google_compute_address" "external_ip" {
#   name = "example-ip"
# }

# Create a Compute Engine instance
resource "google_compute_instance" "AnsibleMaster" {
  name  = "ansible-master"
  machine_type = "e2-small"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  #Startup script
    metadata_startup_script = "${file("bash.sh")}"

  network_interface {
    network = "default"
    access_config {
      #nat_ip = google_compute_address.external_ip.address
    }
  }
}
# Create a Compute Engine instance
resource "google_compute_instance" "AnsibleWorker" {
  count = length(var.worker_names)
  name  = format("ansible-worker-%d", var.worker_names[count.index])
  machine_type = var.vmproperties.vmtype
  boot_disk {
    initialize_params {
      image = var.vmproperties.image
    }
  }

  network_interface {
    network = "default"
    access_config {
      #nat_ip = google_compute_address.external_ip.address
    }
  }
}

#Outputs
# output "public_ip" {
#   value = google_compute_address.external_ip.address
# }