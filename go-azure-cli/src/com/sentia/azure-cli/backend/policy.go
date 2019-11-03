package backend

import (
	"fmt"
	"log"
)

func CreatePolicy(azureConnFile, clientPassword, policyName, policyCreateJsonFile string, verbose bool){
	if policyName == ""{
		log.Fatal("policyName (pn) is a required parameter for creating a policy")
	}
	ac := getConnDetails(azureConnFile, clientPassword)
	url := fmt.Sprintf("https://management.azure.com/subscriptions/%s/providers/Microsoft.authorization/policydefinitions/%s?api-version=2018-03-01", ac.SubscriptionID, policyName)
	payload := readJsonFile(policyCreateJsonFile)
	req := CreateBaseRequest("PUT", url, payload, verbose)
	bearerToken := fmt.Sprintf("Bearer %s", GetApiToken(azureConnFile, clientPassword, verbose))
	req.Header.Add("Authorization", bearerToken)
	req.Header.Add("Content-Type", "application/json")
	req.Header.Add("Cache-Control", "no-cache")
	_, status := HTTPRequest(req, verbose)

	if status == "201 Created"{
		log.Println("Policy was created successfully")
	}else {
		log.Fatal("There was a problem creating the policy. Run with -verbose flag enabled for more information")
	}
}

func AssignPolicy(azureConnFile, clientPassword, policyAssignmentName, policyAssignJsonFile string, verbose bool){
	if policyAssignmentName == "" {
		log.Fatal("policyAssignmentName (pan) is a required parameter for assigning a policy")
	}
	ac := getConnDetails(azureConnFile, clientPassword)
	url := fmt.Sprintf("https://management.azure.com/subscriptions/%s/providers/Microsoft.Authorization/policyAssignments/%s?api-version=2018-03-01", ac.SubscriptionID, policyAssignmentName)
	payload := readJsonFile(policyAssignJsonFile)
	req := CreateBaseRequest("PUT", url, payload, verbose)
	bearerToken := fmt.Sprintf("Bearer %s", GetApiToken(azureConnFile, clientPassword, verbose))
	req.Header.Add("Authorization", bearerToken)
	req.Header.Add("Content-Type", "application/json")
	req.Header.Add("Cache-Control", "no-cache")
	_, status := HTTPRequest(req, verbose)

	if status == "201 Created"{
		log.Println("Policy was assigned successfully")
	}else {
		log.Fatal("There was a problem assigning the policy. Run with -verbose flag enabled for more information")
	}
}