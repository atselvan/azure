package main

import (
	"com/sentia/azure-cli/backend"
	"flag"
	"log"
)

func main() {

	//action
	createPolicy := flag.Bool("createPolicy", false, "Creates a Policy in your Azure subscription. Required : azureConnFile, clientSecret, policyName, policyCreateJsonFile")
	assignPolicy := flag.Bool("assignPolicy", false, "Assigns a Policy to your Azure subscription. Required : azureConnFile, clientSecret, policyAssignmentName, policyAssignJsonFile")
	// params
	clientSecret := flag.String("clientSecret", "", "Client Secret for making a connection via the API")
	policyName := flag.String("pn", "", "Policy name")
	policyAssignmentName := flag.String("pan", "", "PolicyAssignmentName")
	azureConnFile := flag.String("azureConnFile", "./azure-conn.json", "Azure connections file")
	policyCreateFile := flag.String("policyCreateFile", "./policy-create.json", "Policy create JSON file")
	policyAssignFile := flag.String("policyAssignFile", "./policy-assign.json", "Policy assign JSON file")
	verbose := flag.Bool("verbose", false, "Set this flag for verbose logs")
	flag.Parse()

	if *clientSecret == "" {
		log.Fatal("clientSecret is a required parameter for making a connection via azure API")
	}

	if *createPolicy == true {
		backend.CreatePolicy(*azureConnFile, *clientSecret, *policyName, *policyCreateFile, *verbose)
	}else if *assignPolicy == true {
		backend.AssignPolicy(*azureConnFile, *clientSecret, *policyAssignmentName, *policyAssignFile, *verbose)
	}else {
		flag.Usage()
		log.Fatal("Select a valid action flag")
	}
}