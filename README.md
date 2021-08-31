# terraform-postgresql-new-database

Terraform module to create a set of databases with the same username and password using the [postgresql](https://registry.terraform.io/providers/cyrilgdn/postgresql/latest/docs) provider.

This module makes use of Hashicorp's [random](https://registry.terraform.io/providers/hashicorp/random/latest/docs) provider to generate passwords.

## Requirements

You should [configure](https://registry.terraform.io/providers/cyrilgdn/postgresql/latest/docs#usage) the postgresql provider in order to use this module.

## Usage

```hcl
module "app_dbs" {
  source            = "iqz-systems/db-group/postgresql"
  version           = "1.0.0"
  username          = "app_db_user"
  db_names          = ["app_db1", "app_db2"]
  password_length   = 32
}
```

## Variables

- `db_names` set(string)
  - The names of databases to be created.
- `username` string
  - The database username to be created.
- `password_length` number
  - The length of the password to be created.
  - Default: `64`

## Outputs

- `db_password` string
  - The password associated with the user for the database.

## Links

- [Terraform registry](https://registry.terraform.io/modules/iqz-systems/db-group/postgresql/latest)
