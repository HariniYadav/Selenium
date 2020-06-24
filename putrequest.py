import requests
import json
import jsonpath

#API URL
url = "https://reqres.in/api/users/2"

#read input json file
file=open("C:\\Users\\Narayana\\Desktop\\Harini\\Python\\Notepad\\CreateUser.json","r")
#it is a string
json_input=file.read()
request_json=json.loads(json_input)

print(request_json)

#Make PUT request with json input body

response=requests.put(url,request_json)

print(response.status_code)

#parse response to JSON format
json_response=json.loads(response.text)
print(json_response)

#pick id using JSON path
updatedname=jsonpath.jsonpath(json_response,"name")

print(updatedname)
print(updatedname[0])