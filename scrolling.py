from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

#interacting with the Chrome browser
driver=webdriver.Chrome(executable_path=r"C:\chromedriver.exe")

#opening the application
driver.get("https://www.countries-ofthe-world.com/flags-of-the-world.html")

driver.maximize_window()

#scroll dwn page by pixel
#driver.execute_script("window.scrollBy(0,1000)","")

#scroll down still the element is visible
#flag=driver.find_element_by_xpath("//*[@id='content']/div[2]/div[2]/table[1]/tbody/tr[86]/td[1]/img")
#driver.execute_script("arguments[0].scrollIntoView();",flag)

#scroll down till end
driver.execute_script("window.scrollBy(0,document.body.scrollHeight)")