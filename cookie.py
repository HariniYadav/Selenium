from selenium import webdriver
#interacting with the Chrome browser
driver=webdriver.Chrome(executable_path=r"C:\chromedriver.exe")

#opening the application
driver.get("http://www.amazon.in/")

driver.maximize_window()

cookies=driver.get_cookies()
print(len(cookies)) #no of cookies

print(cookies) #dictionary

#adding the cookie
cookie={"name":"Mycookies","value":"1235354"}
driver.add_cookie(cookie)


cookies=driver.get_cookies()
print(len(cookies)) #no of cookies

print(cookies) #dictionary

#deleting cookie
driver.delete_cookie("Mycookies")

cookies=driver.get_cookies()
print(len(cookies)) #no of cookies
print(cookies)
driver.delete_all_cookies()
cookies=driver.get_cookies()
print(len(cookies))


