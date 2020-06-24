import requests
import json
import jsonpath

#API URL
url = "https://reqres.in/api/users"

#read input json file
file=open("C:\\Users\\Narayana\\Desktop\\Harini\\Python\\Notepad\\CreateUser.json","r")
#it is a string
json_input=file.read()
request_json=json.loads(json_input)

print(request_json)

#Make POST request with json input body

response=requests.post(url,request_json)

print(response.status_code)

#fetch header and get a value in header of response
print(response.headers)
print(response.headers.get("Content-Length"))


#parse response to JSON format
json_response=json.loads(response.text)
print(json_response)

#pick id using JSON path
id=jsonpath.jsonpath(json_response,"id")

print(id)
print(id[0])