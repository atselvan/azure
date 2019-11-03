package backend

import (
	"bytes"
	"fmt"
	"io/ioutil"
	"net/http"
	"log"
	"net/url"
)

func HTTPRequest(req *http.Request, verbose bool) ([]byte, string) {

	client := &http.Client{}
	resp, err := client.Do(req)
	Error(err, "There was a problem in making the request")

	defer resp.Body.Close()
	respBody, err := ioutil.ReadAll(resp.Body)
	Error(err, "There was a problem reading the response body")

	if verbose {
		fmt.Println("Response Headers:", resp.Header)
		fmt.Println("Response Status:", resp.Status)
		fmt.Println("Response Body:", string(respBody))
	}
	return respBody, resp.Status
}

func CreateBaseRequest(method, url string, body []byte, verbose bool) *http.Request {
	req, err := http.NewRequest(method, url, bytes.NewBuffer(body))
	req.Header.Set("Content-Type", "application/json")
	req.Header.Set("Accept", "application/json")
	Error(err, "Error creating the request")
	if verbose {
		fmt.Println("Request Url:", req.URL)
		fmt.Println("Request Headers:", req.Header)
	}
	return req
}

func Error(err error, errorMessage string) {
	if err != nil {
		log.Println(errorMessage)
		log.Fatal(err)
	}
}

func encodeString (s string) string {
	encodedString := url.QueryEscape(s)
	return  encodedString
}

func readJsonFile(file string) []byte{
	data, err := ioutil.ReadFile(file)
	Error(err, "There was a error reading the connections file")
	return data
}