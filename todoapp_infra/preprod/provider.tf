terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.30.0"
    }
  }
  backend "azurerm" {
   resource_group_name = "remoterg"
     storage_account_name = "remote007"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "remotecontainer007"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prepod.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

provider "azurerm" {
  features {}
  subscription_id = "e712f7a9-858c-4636-876e-16f5711d3587"
}

