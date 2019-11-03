# Azure Resource Manager

## Mandatory reading

* [Azure Resource Manager overview](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-overview#resource-groups)
* [Resource providers and types](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-supported-services)
* [Understand the structure and syntax of Azure Resource Manager Templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authoring-templates)

## Getting Started (MacOS)

* [Sign up](https://azure.microsoft.com/nl-nl/free/) for a free Azure account
* Secure your azure account with [2FA](https://docs.microsoft.com/en-us/azure/active-directory/authentication/multi-factor-authentication) or [Identity verification apps](https://support.microsoft.com/en-us/help/12414/microsoft-account-identity-verification-apps-faq).
* [Install Azure PowerShell on macOS or Linux](https://docs.microsoft.com/en-us/powershell/azure/install-azurermps-maclinux?view=azurermps-6.3.0)
* [Install Azure CLI 2.0 on macOS](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-macos?view=azure-cli-latest)
* [Get started with Azure CLI 2.0](https://docs.microsoft.com/en-us/cli/azure/get-started-with-azure-cli?view=azure-cli-latest)
* Install VSCode extensions for Azure templates and CLI

## Login using Azure CLI

```bash
az login

Output:
To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code ********* to authenticate.
[
  {
    "cloudName": "AzureCloud",
    "id": "fd072286-94be-497b-a047-a184fe776f0c",
    "isDefault": true,
    "name": "Free Trial",
    "state": "Enabled",
    "tenantId": "f5fca3f3-8f63-4c55-b6b5-e4ec08518f6a",
    "user": {
      "name": "allantony2008@gmail.com",
      "type": "user"
    }
  }
]
```

## Creating a Resource Group via the CLI

```bash
az group create --name sentia-rg --location westeurope --tags Environment=Test Company=Sentia

Output:
{
  "id": "/subscriptions/fd072286-94be-497b-a047-a184fe776f0c/resourceGroups/sentia-rg",
  "location": "westeurope",
  "managedBy": null,
  "name": "sentia-rg",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": {
    "Company": "Sentia",
    "Environment": "Test"
  }
}
```

## Creating a Azure Deployment template

Reference

https://docs.microsoft.com/en-us/azure/templates/microsoft.network/virtualnetworks#VirtualNetworkPeeringPropertiesFormat

https://docs.microsoft.com/en-us/azure/templates/microsoft.storage/storageaccounts

https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy-lrs

## Azure Policy

Reference

https://docs.microsoft.com/en-us/azure/azure-policy/azure-policy-introduction

https://docs.microsoft.com/en-us/azure/azure-policy/policy-definition

https://docs.microsoft.com/en-us/azure/azure-policy/create-manage-policy#create-a-policy-definition-with-rest-api

https://docs.microsoft.com/en-us/azure/azure-policy/create-manage-policy#create-a-policy-definition-with-azure-cli

## Azure REST API

Reference:

https://www.youtube.com/watch?v=ujzrq8Fg9Gc