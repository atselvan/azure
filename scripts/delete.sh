#!/bin/bash

#Delete created policies and resource groups
echo "Deleting Policy Assignment..."
az policy assignment delete -n allowedResourceTypes

echo "Deleting Policy Definition..."
az policy definition delete --name allowedResourceTypes

echo "Deleting Resource Group..."
az group delete --name sentia-rg --yes