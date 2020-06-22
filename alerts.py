from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

#interacting with the Chrome browser
driver=webdriver.Chrome(executable_path=r"C:\chromedriver.exe")

#opening the application
driver.get("https://testautomationpractice.blogspot.com/")

driver.maximize_window()
#driver.find_element_by_xpath("//*[@id='HTML9']/div[1]/button").click()
time.sleep(5)

#driver.switch_to.alert.accept()

#uploading the files
driver.switch_to.frame("frame-one1434677811")

driver.find_element_by_id("RESULT_FileUpload-10").send_keys("C://Users/Narayana/Desktop/Harini/Python/Assesment")



