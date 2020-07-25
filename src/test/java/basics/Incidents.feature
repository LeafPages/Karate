Feature: Create Incidents

Background:

Given url 'https://dev49243.service-now.com/api/now/table/incident'
And header Authorization = call read('basic-auth.js') {username: 'admin', password: 'Tuna@123' }

Scenario: Get incidents from ServiceNow
When params {"sysparm_limit": "1", "category" : "software"}
And method get
Then status 200
And match header Content-Type contains 'application/json'
And print response

Scenario Outline: Create New Incident with different values
When request {"short_description": <short_desc>}
And method post
Then assert responseTime < 10000
And match responseType == 'json'
And match response.result.short_description contains 'Data'

Examples:
|short_desc|
|First Data|
|Second Data|