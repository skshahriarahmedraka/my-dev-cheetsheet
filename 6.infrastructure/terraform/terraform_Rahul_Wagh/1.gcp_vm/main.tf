provider "google" {
    credentials = file("gcp_credentials.json")
    project     = "gcp-terraform-2021"
    region      = "europe-west4"
    zone       = "europe-west4-a"
}


resource "google_compute_instance" "default" {
    name         = "test"
    machine_type = "e2-micro"
    zone         = "europe-west4-a"

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-9"
        }
    }

    network_interface {
        network = "default"
        access_config {
            // Ephemeral IP
        }
    }
}