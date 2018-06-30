#Delete created policies and resource groups
az policy definition delete --name allowedTypes
az policy assignment delete -g sentia-rg -n allowedTypes
az group delete --name sentia-rg --yes