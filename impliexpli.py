from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

#interacting with the Chrome browser
driver=webdriver.Chrome(executable_path=r"C:\chromedriver.exe")

#opening the application
driver.get("http://newtours.demoaut.com/")

driver.implicitly_wait(10)

assert "Welcome1: Mercury Tours" in driver.title

ele=driver.find_element_by_name("userName")
ele1=driver.find_element_by_name("password")
ele.send_keys("mercury")
ele1.send_keys("mercury")

wait=WebDriverWait(driver,10)
element=wait.until(EC.element_to_be_clickable((By.NAME,"login")))
element.click()

time.sleep(10)
driver.close()