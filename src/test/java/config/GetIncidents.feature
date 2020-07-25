Feature: Get the first 5 Incidents of category (software)

Background: Read the variables from config file
* url baseUrl
* def username = username
* def password = password

Given url 'https://'+baseUrl+'.service-now.com/api/now/table/incident'
And header Authorization = call read('basic-auth.js') {username: '#(username)', password: '#(password)' }

Scenario: Get incidents from ServiceNow
When params {"sysparm_limit": "5", "category" : "software"}
And method get
Then status 200
And match header Content-Type contains 'application/json'
And print response
