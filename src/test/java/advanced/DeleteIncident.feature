Feature: Delete Incident (Read by Get Incidents)

Background:
* def getResponse = call read('GetIncidents.feature')
* def sys_id = getResponse.response.result[0].sys_id
* url baseUrl
* def username = username
* def password = password

Given url 'https://'+baseUrl+'.service-now.com/api/now/table/incident/'+sys_id
And header Authorization = call read('basic-auth.js') {username: '#(username)', password: '#(password)' }

Scenario: Delete recently read incident
When method delete
Then status 204