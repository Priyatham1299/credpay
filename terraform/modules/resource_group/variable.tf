variable "name" {
  type = string
}
variable "location" {
  type = string
  default = "canadacentral"
}
variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
  }
}