from selenium import webdriver
from selenium.webdriver import ActionChains
import time

#interacting with the Chrome browser
driver=webdriver.Chrome(executable_path=r"C:\chromedriver.exe")

#opening the application
driver.get("https://opensource-demo.orangehrmlive.com")

driver.maximize_window()


driver.find_element_by_id("txtUsername").send_keys("Admin")
driver.find_element_by_id("txtPassword").send_keys("admin123")
driver.find_element_by_id("btnLogin").click()

admin=driver.find_element_by_xpath("//*[@id='menu_admin_viewAdminModule']/b")
userManagement=driver.find_element_by_xpath("//*[@id='menu_admin_UserManagement']")
users=driver.find_element_by_xpath("//*[@id='menu_admin_viewSystemUsers']")

actions=ActionChains(driver)
actions.move_to_element(admin).move_to_element(userManagement).move_to_element(users).click().perform()

time.sleep(10)
driver.close()