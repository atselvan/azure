#Generating Autentication token
curl -X POST \
  https://login.microsoftonline.com/f5fca3f3-8f63-4c55-b6b5-e4ec08518f6a/oauth2/token \
  -H 'Cache-Control: no-cache' \
  -F grant_type=client_credentials \
  -F client_id=fcb5a2f6-033f-4b59-b90b-db7769d46fa5 \
  -F "client_secret=$clientSecret" \
  -F resource=https://management.azure.com/

# Creating Policy Definition
curl -X PUT \
  'https://management.azure.com/subscriptions/fd072286-94be-497b-a047-a184fe776f0c/providers/Microsoft.authorization/policydefinitions/allowedResourceTypes?api-version=2018-03-01' \
  -H "Authorization: Bearer $bearerToken" \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d '{
    "properties": {
        "displayName": "Allowed Resource Types",
        "description": "This policy allows only the compute, network and storage resource types.",
        "policyRule": {
            "if":{
                "not": {
                    "field":"type",
                    "in": "[parameters('\''allowedResourceTypes'\'')]"
                }
            },
            "then": {
                "effect": "deny"
             }
        },
        "parameters": {
            "allowedResourceTypes": {
                "type": "Array",
                "metadata": {
                    "description" : "The type of Allowed resource types",
                    "displayName": "Allowed Resource Types",
                    "strongType": "resourceTypes"
                }
            }
        }
    }
}'

# Assigning Policy Definition
curl -X PUT \
  'https://management.azure.com/subscriptions/fd072286-94be-497b-a047-a184fe776f0c/providers/Microsoft.Authorization/policyAssignments/allowedTypes?api-version=2018-03-01' \
  -H 'Authorization: Bearer $bearerToken' \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d '{
    "properties": {
      "displayName": "Allowed Resource Types",
      "description": "This policy allows only the compute, network and storage resource types",
      "metadata": {
        "assignedBy": "Allan Tony selvan"
      },
      "policyDefinitionId": "/subscriptions/fd072286-94be-497b-a047-a184fe776f0c/providers/Microsoft.Authorization/policyDefinitions/allowedResourceTypes",
      "parameters": {
        "allowedResourceTypes": {
          "value": ["Microsoft.Compute/availabilitySets",
            "Microsoft.Compute/virtualMachines",
            "Microsoft.Compute/virtualMachines/extensions",
            "Microsoft.Compute/virtualMachineScaleSets",
            "Microsoft.Compute/virtualMachineScaleSets/extensions",
            "Microsoft.Compute/virtualMachineScaleSets/virtualMachines",
            "Microsoft.Compute/virtualMachineScaleSets/networkInterfaces",
            "Microsoft.Compute/virtualMachineScaleSets/virtualMachines/networkInterfaces",
            "Microsoft.Compute/virtualMachineScaleSets/publicIPAddresses",
            "Microsoft.Compute/locations",
            "Microsoft.Compute/locations/operations",
            "Microsoft.Compute/locations/vmSizes",
            "Microsoft.Compute/locations/runCommands",
            "Microsoft.Compute/locations/usages",
            "Microsoft.Compute/locations/virtualMachines",
            "Microsoft.Compute/locations/publishers",
            "Microsoft.Compute/operations",
            "Microsoft.Compute/restorePointCollections",
            "Microsoft.Compute/restorePointCollections/restorePoints",
            "Microsoft.Compute/virtualMachines/diagnosticSettings",
            "Microsoft.Compute/virtualMachines/metricDefinitions",
            "Microsoft.Compute/sharedVMImages",
            "Microsoft.Compute/sharedVMImages/versions",
            "Microsoft.Compute/locations/capsoperations",
            "Microsoft.Compute/disks",
            "Microsoft.Compute/snapshots",
            "Microsoft.Compute/locations/diskoperations",
            "Microsoft.Compute/images",
            "Microsoft.Compute/locations/logAnalytics",
            "Microsoft.Storage/storageAccounts",
            "Microsoft.Storage/operations",
            "Microsoft.Storage/locations/asyncoperations",
            "Microsoft.Storage/storageAccounts/listAccountSas",
            "Microsoft.Storage/storageAccounts/listServiceSas",
            "Microsoft.Storage/storageAccounts/blobServices",
            "Microsoft.Storage/storageAccounts/tableServices",
            "Microsoft.Storage/storageAccounts/queueServices",
            "Microsoft.Storage/storageAccounts/fileServices",
            "Microsoft.Storage/locations",
            "Microsoft.Storage/locations/usages",
            "Microsoft.Storage/locations/deleteVirtualNetworkOrSubnets",
            "Microsoft.Storage/usages",
            "Microsoft.Storage/checkNameAvailability",
            "Microsoft.Storage/storageAccounts/services",
            "Microsoft.Storage/storageAccounts/services/metricDefinitions",
            "Microsoft.Network/virtualNetworks",
            "Microsoft.Network/publicIPAddresses",
            "Microsoft.Network/networkInterfaces",
            "Microsoft.Network/loadBalancers",
            "Microsoft.Network/networkSecurityGroups",
            "Microsoft.Network/applicationSecurityGroups",
            "Microsoft.Network/routeTables",
            "Microsoft.Network/networkWatchers",
            "Microsoft.Network/networkWatchers/connectionMonitors",
            "Microsoft.Network/networkWatchers/lenses",
            "Microsoft.Network/virtualNetworkGateways",
            "Microsoft.Network/localNetworkGateways",
            "Microsoft.Network/connections",
            "Microsoft.Network/applicationGateways",
            "Microsoft.Network/locations",
            "Microsoft.Network/locations/operations",
            "Microsoft.Network/locations/operationResults",
            "Microsoft.Network/locations/CheckDnsNameAvailability",
            "Microsoft.Network/locations/usages",
            "Microsoft.Network/locations/virtualNetworkAvailableEndpointServices",
            "Microsoft.Network/locations/availableDelegations",
            "Microsoft.Network/locations/supportedVirtualMachineSizes",
            "Microsoft.Network/locations/checkAcceleratedNetworkingSupport",
            "Microsoft.Network/locations/validateResourceOwnership",
            "Microsoft.Network/locations/setResourceOwnership",
            "Microsoft.Network/locations/effectiveResourceOwnership",
            "Microsoft.Network/operations",
            "Microsoft.Network/dnszones",
            "Microsoft.Network/dnsOperationResults",
            "Microsoft.Network/dnsOperationStatuses",
            "Microsoft.Network/dnszones/A",
            "Microsoft.Network/dnszones/AAAA",
            "Microsoft.Network/dnszones/CNAME",
            "Microsoft.Network/dnszones/PTR",
            "Microsoft.Network/dnszones/MX",
            "Microsoft.Network/dnszones/TXT",
            "Microsoft.Network/dnszones/SRV",
            "Microsoft.Network/dnszones/SOA",
            "Microsoft.Network/dnszones/NS",
            "Microsoft.Network/dnszones/CAA",
            "Microsoft.Network/dnszones/recordsets",
            "Microsoft.Network/dnszones/all",
            "Microsoft.Network/trafficmanagerprofiles",
            "Microsoft.Network/trafficmanagerprofiles/heatMaps",
            "Microsoft.Network/checkTrafficManagerNameAvailability",
            "Microsoft.Network/trafficManagerUserMetricsKeys",
            "Microsoft.Network/trafficManagerGeographicHierarchies",
            "Microsoft.Network/expressRouteCircuits",
            "Microsoft.Network/expressRouteServiceProviders",
            "Microsoft.Network/applicationGatewayAvailableWafRuleSets",
            "Microsoft.Network/applicationGatewayAvailableSslOptions",
            "Microsoft.Network/routeFilters",
            "Microsoft.Network/bgpServiceCommunities",
            "Microsoft.Network/ddosProtectionPlans"]
        }
      }
    }
  }'  