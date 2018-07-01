# Azure CLI

This cli can be user to create a policy and assign it via the Azure Resource Manager API. The CLI fetches the Bearer token internally for making the request.

## Building the CLI

### Set GOPATH environment variable

Go to the path of the CLI and run the below command

```bash
export GOPATH=$(pwd)
```

Verify if the path is set correctly by running ```go env```

### Build the package

Go to the path containing the main.go file ```src/com/sentia/azure-cli/``` and run the ```go build``` command.

## Using the CLI

## Create the azure connection file

Example file:

```json
{
	"subscriptionId": "fd072286-94be-497b-a047-a184fe776f0c",
	"tenant_id": "f5fca3f3-8f63-4c55-b6b5-e4ec08518f6a",
	"grant_type": "client_credentials",
	"client_id": "fcb5a2f6-033f-4b59-b90b-db7769d46fa5",
	"resource": "https://management.azure.com/"
}
```

## Usage

```bash
./azure-cli --help
Usage of ./azure-cli:
  -assignPolicy
    	Assigns a Policy to your Azure subscription. Required : azureConnFile, clientSecret, policyAssignmentName, policyAssignJsonFile
  -azureConnFile string
    	Azure connections file (default "./azure-conn.json")
  -clientSecret string
    	Client Secret for making a connection via the API
  -createPolicy
    	Creates a Policy in your Azure subscription. Required : azureConnFile, clientSecret, policyName, policyCreateJsonFile
  -pan string
    	PolicyAssignmentName
  -pn string
    	Policy name
  -policyAssignFile string
    	Policy assign JSON file (default "./policy-assign.json")
  -policyCreateFile string
    	Policy create JSON file (default "./policy-create.json")
  -verbose
    	Set this flag for verbose logs
```