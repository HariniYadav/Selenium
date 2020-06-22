from selenium import webdriver
from selenium.webdriver import ActionChains
import time

#interacting with the Chrome browser
driver=webdriver.Chrome(executable_path=r"C:\chromedriver.exe")

#opening the application
driver.get("https://testautomationpractice.blogspot.com/")

driver.maximize_window()

element=driver.find_element_by_xpath("//*[@id='HTML10']/div[1]/button")

actions=ActionChains(driver)
actions.double_click(element).perform()

#actions.context_click(element).perform()
#where right click is performed on elemnet which displays data when a right click action performed on it

#actions.drag_and_drop(source,target).perform()