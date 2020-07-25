Feature: Create Incidents

Background:
* url baseUrl
* def username = username
* def password = password

Given url 'https://'+baseUrl+'.service-now.com/api/now/table/incident'
And header Authorization = call read('basic-auth.js') {username: '#(username)', password: '#(password)' }

Scenario Outline: Create New Incident with different values
When request {"short_description": <short_desc>}
And method post
Then assert responseTime < 10000
And match responseType == 'json'
And match response.result.short_description contains 'Data'

Examples:
|short_desc|
|First Data|