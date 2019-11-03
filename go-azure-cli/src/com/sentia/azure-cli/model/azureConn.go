package model

type AzureConn struct {
	SubscriptionID string `json:"subscriptionId"`
	TenantID       string `json:"tenant_id"`
	GrantType      string `json:"grant_type"`
	ClientID       string `json:"client_id"`
	ClientSecret   string
	Resource       string `json:"resource"`
}