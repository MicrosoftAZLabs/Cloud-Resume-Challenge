# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }

  backend "azurerm" {
    resource_group_name   = "CloudResumeChallenge1234"
    storage_account_name  = "terraformbackend1234"
    container_name        = "terraformstate-file"
    key                   = "terraform.tfstate"
  }
}