terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatestorage1234"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    sas_token            =  "sp=r&st=2025-09-26T13:50:15Z&se=2025-09-26T22:05:15Z&sv=2024-11-04&sr=c&sig=MrVWKxiQT67bSTvM%2FjMHP8ePDcvM7ADekYX2Zy65ehU%3D"
  }
}
