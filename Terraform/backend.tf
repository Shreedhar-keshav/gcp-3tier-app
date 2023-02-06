terraform {
  backend "gcs" {
    bucket = "3tier-app-tf-backend" #change
    prefix = "/statefile/us-central-1" #change

  }
}
