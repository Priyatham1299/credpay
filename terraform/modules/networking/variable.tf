variable "name_prefix" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "location" {
  type = string
  default = "canadacentral"
}
variable "vnet_address_space" {
    type = string
} 
variable "aks_subnet_address_space" {
    type = string
}
variable "postgres_subnet_address_space" {
    type = string
}
variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
  }
}