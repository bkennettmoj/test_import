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

data "azuread_user" "example" {
   user_principal_name = "TempTestUser2@nomsdigitechoutlook.onmicrosoft.com"
 #  object_id = "c7588935-12cf-4fd1-96fa-6040e1a5175c"
  }

data "azuread_group" "example_MyGroup" {
#    name = "MyGroup"
    object_id = "37437fc1-e265-48fd-a1ae-4bc0fb127c36"
  }
 
 resource "azuread_group_member" "MyGroup_TempTestUser2" {
    group_object_id   = data.azuread_group.example_MyGroup.id
    member_object_id  = data.azuread_user.example.id
   lifecycle {
      create_before_destroy = true
    }
  }

