output "db_names" {
  value       = postgresql_database.db[*].name
  sensitive   = false
  description = "A set containing all names of the databases."
}

output "db_username" {
  value       = postgresql_role.db_user.name
  sensitive   = false
  description = "The username using which the database can be accessed."
}

output "db_password" {
  value       = postgresql_role.db_user.name.password
  sensitive   = true
  description = "The password associated with the user for the databases."
}
