import requests


#API URL
url = "https://reqres.in/api/users/2"

#send DELETE request
response = requests.delete(url)
print(response.status_code)

assert response.status_code==204