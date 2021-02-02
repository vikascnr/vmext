// Get Keyvault Data

data "azurerm_resource_group" "rg_keyvault" {

name = "VikasRg"

}

data "azurerm_key_vault" "keyvault" {

name = "vikascnrtfsp"

resource_group_name = "${data.azurerm_resource_group.rg_keyvault.name}"

}


data "azurerm_key_vault_secret" "client_secret" {

name = "client-secret"

key_vault_id = data.azurerm_key_vault.keyvault.id

}
output "secret_value" {
  value = data.azurerm_key_vault_secret.client_secret.value
}

provider "azurerm" {  
     
    subscription_id = "883bf586-e0da-4577-91da-2a0f42a08f64"  
    tenant_id = "687f51c3-0c5d-4905-84f8-97c683a5b9d1" 
    //Use this only for Service Principle based authentication  
    client_id = "ed6d67ac-f656-4a01-b1a3-30abf5b65872"  
    client_secret =  "h2DAL5jKfS1mx9fQs_nJRNQIsF_ciQvs1q"
        //use_msi = true // uncomment and set to true for using System Assigned Managed Identities  
    features {}  
}  
