# Resource group details
$rgName = "ps-vm"
$location = "westeurope"

# Tags
$tags = @{ Owner = “allantony2008@gmail.com”; Environment = “Labs”; CostCenter = “PSIN001”}

# Virtual network details
$vnetName = "ps-vnet01"

# Virtual Machine details
$vmName = "vm001"
$vmSize = "Standard_B1s"
$pipName = "$vmName-ip"
$nsgName = "$vmName-nsg"
$nicName = "$vmName-nic"

# Create Resource group
New-AzResourceGroup -Name $rgName -Location $location

# Create user object
$cred = Get-Credential -Message "Enter a username and password for the virtual machine."

# Get vnet details
$vnet = Get-AzVirtualNetwork -Name $vnetName

# Create a public IP address and specify a DNS name
$pip = New-AzPublicIpAddress -Name $pipName -ResourceGroupName $rgName -Location $location -AllocationMethod Static -IdleTimeoutInMinutes 4 -Tag $tags

# Create an inbound network security group rule for port 3389
$nsgRuleRDP = New-AzNetworkSecurityRuleConfig -Name "$nsgName-rdp-rule" -Protocol Tcp -Direction Inbound -Priority 1000 -SourceAddressPrefix * -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 3389 -Access Allow

# Create a network security group
$nsg = New-AzNetworkSecurityGroup -Name $nsgName -ResourceGroupName $rgName -Location $location -SecurityRules $nsgRuleRDP

# Create a virtual network card and associate with public IP address and NSG
$nic = New-AzNetworkInterface -Name $nicName -ResourceGroupName $rgName -Location $location -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $pip.Id -NetworkSecurityGroupId $nsg.Id

# Create a virtual machine configuration
$vmConfig = New-AzVMConfig -VMName $vmName -VMSize $vmSize | `
Set-AzVMOperatingSystem -Windows -ComputerName $vmName -Credential $cred | `
Set-AzVMSourceImage -PublisherName MicrosoftWindowsServer -Offer WindowsServer -Skus 2019-Datacenter -Version latest | `
Add-AzVMNetworkInterface -Id $nic.Id

# Create a virtual machine
New-AzVM -VM $vmConfig -ResourceGroupName $rgName -Location $location