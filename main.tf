terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }
  backend "remote" {
    organization = "Teledoc_Project"  # ⚠️  REPLACE WITH YOUR ACTUAL ORGANIZATION NAME
    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
  # Configuration will come from Terraform Cloud environment variables:
  # SNOWFLAKE_ACCOUNT, SNOWFLAKE_USER, SNOWFLAKE_PASSWORD, etc.
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"  # ✅ Fixed: Added = and value
}
