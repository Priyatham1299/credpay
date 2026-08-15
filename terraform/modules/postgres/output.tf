output "server_id" {
  value = azurerm_postgresql_flexible_server.pgs.id
  description = "The ID of the PostgreSQL Flexible Server"
  
}
output "fqdn" {
  value = azurerm_postgresql_flexible_server.pgs.fqdn
  description = "The FQDN of the PostgreSQL Flexible Server"
}
output "server_name" {
  value = azurerm_postgresql_flexible_server.pgs.name
  description = "The name of the PostgreSQL Flexible Server"
}
output "database_name" {
  value = azurerm_postgresql_flexible_server_database.pgdb.name
  description = "The name of the PostgreSQL database"
}
output "admin_username" {
  value = azurerm_postgresql_flexible_server.pgs.administrator_login
  description = "The administrator username for the PostgreSQL Flexible Server"
}
output "admin_password" {
  value = random_password.admin.result
  description = "The administrator password for the PostgreSQL Flexible Server"
  sensitive = true
}