variable "bgtest_image" {
  type        = string
  description = "Tempo Docker image to use"
  default     = "loafoe/bg:v0.0.4"
}
variable "cf_org" {
  type        = string
  description = "The CF Org to deploy under"
}
variable "cf_space" {
  type        = string
  description = "The CF Space to deploy in"
}
variable "cf_domain" {
  type        = string
  description = "The CF domain to use for Grafana"
}
variable "environment" {
  type        = map(any)
  description = "Environment variables for Grafana Tempo"
  default     = {}
}
variable "memory" {
  type        = number
  description = "The amount of RAM to allocate"
  default     = 64
}

variable "disk" {
  type        = number
  description = "The amount of Disk space to allocate"
  default     = 512
}

variable "strategy" {
  type        = string
  description = "The deployment strategy"
  default     = "blue-green"
}
