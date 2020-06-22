from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

#interacting with the Chrome browser
driver=webdriver.Chrome(executable_path=r"C:\chromedriver.exe")

#opening the application
driver.get("http://newtours.demoaut.com/")

#title of the page
title=driver.title
print("Title of the web page: ",title)

#url of thr application
print(driver.current_url)

ele=driver.find_element_by_name("userName")
print(ele.is_displayed())
print(ele.is_enabled())

ele1=driver.find_element_by_name("password")


ele.send_keys("mercury")
ele1.send_keys("mercury")
driver.find_element_by_name("login").click()


ele2=driver.find_element_by_css_selector("input[value=roundtrip]")

print(ele2.is_selected())

ele3=driver.find_element_by_css_selector("input[value=oneway]")

print(ele3.is_selected())
time.sleep(3)
driver.back()
driver.find_element_by_link_text("REGISTER").click()
driver.back()

time.sleep(3)

driver.forward()

time.sleep(3)

#to identify all the links
links=driver.find_elements_by_tag_name("a")

print(len(links))

driver.quit()

