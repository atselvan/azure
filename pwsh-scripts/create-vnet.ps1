
# Resource group details
$rgName = "ps-network"
$location = "westeurope"

# Tags
$tags = @{ Owner = “allantony2008@gmail.com”; Environment = “Labs”; CostCenter = “PSIN001”}

# Create Resource group
New-AzResourceGroup -Name $rgName -Location $location

# Virtual network details
$vnetName = "ps-vnet01"
$vnetAddressPrefix = "10.0.0.0/22"

# Subnet details
$subnet01Name = "subnet01"
$subnet01AddressPrefix = "10.0.0.0/24"
$subnet02Name = "subnet02"
$subnet02AddressPrefix = "10.0.1.0/24"
$subnet03Name = "subnet03"
$subnet03AddressPrefix = "10.0.2.0/24"

# Create subnet config
$subnet01 = New-AzVirtualNetworkSubnetConfig -Name $subnet01Name -AddressPrefix $subnet01AddressPrefix
$subnet02 = New-AzVirtualNetworkSubnetConfig -Name $subnet02Name -AddressPrefix $subnet02AddressPrefix

# Create vnet with two subnets
$vnet = New-AzVirtualNetwork -Name $vnetName -ResourceGroupName $rgName -Location $location -AddressPrefix $vnetAddressPrefix -Subnet $subnet01, $subnet02 -Tag $tags

# Modifying the vnet created to add the third subnet
Add-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name $subnet03Name -AddressPrefix $subnet03AddressPrefix

# Save the additional subnet config
Set-AzVirtualNetwork -VirtualNetwork $vnet
