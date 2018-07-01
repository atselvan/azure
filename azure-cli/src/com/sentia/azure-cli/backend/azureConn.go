package backend

import (
	"log"
	"encoding/json"
	"com/sentia/azure-cli/model"
	"fmt"
	"strings"
	"net/http"
)

func getConnDetails(azureConnFile, clientPassword string) model.AzureConn{
	if clientPassword == "" {
		log.Fatal("clientPassword is a required parameter to get the access token")
	}
	data := readJsonFile(azureConnFile)
	var azureConn model.AzureConn
	json.Unmarshal(data, &azureConn)
	azureConn.ClientSecret = clientPassword
	return azureConn
}

func GetApiToken(azureConnFile, clientPassword string, verbose bool) string{
	var token model.Token
	ac := getConnDetails(azureConnFile, clientPassword)
	url := fmt.Sprintf("https://login.microsoftonline.com/%s/oauth2/token", ac.TenantID)

	payloadString := fmt.Sprintf("grant_type=%s&client_id=%s&client_secret=%s&resource=%s", ac.GrantType, ac.ClientID, encodeString(ac.ClientSecret), encodeString(ac.Resource))
	payload := strings.NewReader(payloadString)

	req, _ := http.NewRequest("POST", url, payload)

	req.Header.Add("Content-Type", "application/x-www-form-urlencoded")
	req.Header.Add("Cache-Control", "no-cache")

	respBody, _ := HTTPRequest(req, verbose)
	json.Unmarshal(respBody, &token)
	return token.AccessToken
}