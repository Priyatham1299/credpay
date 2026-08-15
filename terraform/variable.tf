variable "subscription_id" {
  type        = string
}
variable "location" {
  type        = string
  default     = "canadacentral"
}

# ----- Networking -----

variable "vnet_address_space" {
  type        = string
  default     = "10.0.0.0/16"
}
variable "aks_subnet_prefix" {
  type        = string
  default     = "10.0.1.0/20"
}
variable "postgres_subnet_prefix" {
  type        = string
  default     = "10.0.16.0/24"
}

# ----- AKS -----

variable "node_count" {
  type        = number
  default     = 2
}
variable "node_min_count" {
  type        = number
  default     = 2
}
variable "node_max_count" {
  type        = number
  default     = 2
}
variable "vm_size" {
  type        = string
  default     = "Standard_DS2alds_v6"
}

# ----- PostgreSQL -----

variable "postgres_version" {
  type        = string
  default     = "18"
}
variable "postgres_admin_username" {
  type        = string
  default     = "credpayadmin"
}
variable "database_name" {
  type        = string
  default     = "credpay"
}

# ----- Monitoring -----

variable "logretention_days" {
  type        = number
  default     = 30
}
variable "keyvault_name" {
  type        = string
}
variable "keyvault_resource_group_name" {
  type        = string
}