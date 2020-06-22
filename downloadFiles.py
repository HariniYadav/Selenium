from selenium import webdriver
from selenium.webdriver.chrome.options import Options
chromeOptions=Options()
chromeOptions.add_experimental_option("prefs",{"download.default_directory": "C:\\Program"})
#directory created and files are saved and use options instead of chrome_options3
import time

#interacting with the Chrome browser
driver=webdriver.Chrome(executable_path=r"C:\chromedriver.exe",options=chromeOptions)

#opening the application
driver.get("http://demo.automationtesting.in/FileDownload.html")

driver.maximize_window()

driver.find_element_by_id("textbox").send_keys("testing download file")
driver.find_element_by_id("createTxt").click()
driver.find_element_by_id("link-to-download").click()

driver.find_element_by_id("pdfbox").send_keys("testing download file")
driver.find_element_by_id("createPdf").click()
driver.find_element_by_id("pdf-link-to-download").click()
