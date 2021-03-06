terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.14.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

resource "random_password" "db_password" {
  length           = var.password_length
  special          = true
  override_special = "_%()@!~+-*"

  keepers = {
    user_name = var.username
  }
}

resource "postgresql_role" "db_user" {
  name     = random_password.db_password.keepers.user_name
  password = random_password.db_password.result

  login           = true
  superuser       = false
  create_database = false
  create_role     = false
}

resource "postgresql_database" "db" {
  for_each = var.db_names

  name  = each.value
  owner = postgresql_role.db_user.name

  connection_limit  = -1
  allow_connections = true
}

// Removes permissions from the public schema to prevent
// other users in the database instance from being able
// to access it.
resource "postgresql_grant" "revoke_other" {
  for_each = postgresql_database.db

  database    = each.value.name
  role        = "public"
  object_type = "database"
  privileges  = []
}
