provider "google" {
  credentials = file("creds.json")
  project     = "long-perception-417612"
  region      = "us-west1"
  zone        = "us-west1-b"
}