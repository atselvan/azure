#!/bin/bash

clientSecret="$( cat ./secret )"
azureCli="./azure-cli/src/com/sentia/azure-cli/azure-cli"

#Create Resource Group
echo "========================================================================================================"
echo "Creating Resource Group via Azure CLI..."
az group create --name sentia-rg --location westeurope --tags Environment=Test Company=Sentia
echo "========================================================================================================"

#Create Policy Definition
echo "========================================================================================================"
echo "Creating Policy Definition via the API..."
$azureCli -createPolicy -clientSecret $clientSecret -pn allowedResourceTypes
echo "========================================================================================================"

#Assign Policy Definition
echo "========================================================================================================"
echo "Assigning Policy via the API..."
$azureCli -assignPolicy -clientSecret $clientSecret -pan allowedResourceTypes
echo "========================================================================================================"

# Deploy Template
echo "========================================================================================================"
echo "Deploying template to create Storage Account and Virtual Network via Azure CLI..."
az group deployment create --resource-group sentia-rg --name sentia-deploy --template-file azure-deploy.json
echo "========================================================================================================"