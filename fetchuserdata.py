import requests
import json
import jsonpath

#API URL
url = "https://reqres.in/api/users?page=2"

#send GET request
response = requests.get(url)
#print(response)

#Diplay response contnet
#print(response.content)

#header of response
#print(response.headers)

#parse response to json format
json_response=json.loads(response.text)
#print(json_response)

#fetch value using json path
pages=jsonpath.jsonpath(json_response,"total_pages")
print(pages)
print(pages[0])

assert pages[0]==2