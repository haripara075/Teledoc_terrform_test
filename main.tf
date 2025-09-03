terraform {
  required_version = ">= 1.0"
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }
  
  backend "remote" {
    organization = "Teladoc_Project"
    workspaces {
      name = "Teledoc_workspace"
    }
  }
}

# Define variables that will be provided by Terraform Cloud
variable "snowflake_account" {
  description = "Snowflake account identifier"
  type        = string
}

variable "snowflake_user" {
  description = "Snowflake username"  
  type        = string
}

variable "snowflake_private_key" {
  description = "RSA private key for authentication"
  type        = string
  sensitive   = true
}

# Configure Snowflake provider with the variables
provider "snowflake" {
  account     = var.snowflake_account
  username    = var.snowflake_user
  private_key = var.snowflake_private_key
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}
