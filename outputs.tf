output "db_names" {
  value       = [for value in postgresql_database.db : value.name]
  sensitive   = false
  description = "A set containing all names of the databases."
}

output "db_username" {
  value       = postgresql_role.db_user.name
  sensitive   = false
  description = "The username using which the database can be accessed."
}

output "db_password" {
  value       = postgresql_role.db_user.password
  sensitive   = true
  description = "The password associated with the user for the databases."
}
