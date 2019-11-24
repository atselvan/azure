# Resource group details
$rgName = "ps-rg"
$location = "westeurope"

# Tags
$tags = @{ Owner = “allantony2008@gmail.com”; Environment = “Labs”; CostCenter = “PSIN001”}

# Create Resource group
New-AzResourceGroup -Name $rgName -Location $location