terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.30.0"
    }
  }
}

provider "google" {
  project = "zolostay-practice"
  region  = "us-central1"
  zone    = "us-central1-c"

}