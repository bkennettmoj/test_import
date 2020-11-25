# Configure the Azure provider
   terraform {
     required_version = "0.12.28"
     required_providers {
       azurerm = {
   #      source   = "hashicorp/azurerm"
         version  = ">= 2.0.0"
         features = {}
       }
       azuread = {
        version = "=0.7.0"
      }
    }
  }

