variable "instance_name" {
  type        = string
  default     = "l7-xlb-mig-template"
  description = "add your instance name"
}

variable "machine_type" {
  type        = string
  default     = "e2-small"
  description = "add your machine type"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "add desired region"
}


variable "zone" {
  type        = string
  default     = "us-central1-c"
  description = "zone where to deploy resource"
}

variable "instance_group_name" {
  type        = string
  default     = "l7-xlb-mig1"
  description = "add your instance group name"
}

variable "forwarding_rule_name" {
  type        = string
  default     = "l7-xlb-forwarding-rule"
  description = "add your forwarding rule name"
}

variable "health_check_name" {
  type        = string
  default     = "l7-xlb-hc"
  description = "add your health check name"
}

variable "url_map_name" {
  type        = string
  default     = "l7-xlb-url-map"
  description = "add your url map name"
}

variable "backend_service_name" {
  type        = string
  default     = "l7-xlb-backend-service"
  description = "add your backend service name"
}

variable "router_name" {
  type        = string
  default     = "my-router"
  description = "add your router name"
}

variable "nat_name" {
  type        = string
  default     = "my-router-nat"
  description = "add your router name"
}

variable "project_name" {
  type        = string
  default     = "zolostay-practice"
  description = "enter your project name"
}

variable "db_instance_name" {
  type        = string
  default     = "app-db"  #change
  description = "input the database name"
}

variable "db_username" {
  type        = string
  default     = "shree"  #change
  description = "input the database authorized user "
}

variable "db_host" {
  type        = string
  default     = "%"
  description = "description"
}

variable "db_password" {
  type        = string
  default     = "shree" #change
  description = "description"
}

variable "network" {
  type        = string
  default     = "l7-xlb-network" #change
  description = "description"
}

variable "subnet" {
  type        = string
  default     = "l7-xlb-subnet" #change
  description = "description"
}

