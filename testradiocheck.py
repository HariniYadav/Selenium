from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support.ui import Select

#interacting with the Chrome browser
driver=webdriver.Chrome(executable_path=r"C:\chromedriver.exe")

#opening the application
driver.get("http://fs2.formsite.com/meherpavan/form2/index.html?1537702596407")

driver.maximize_window()
inputBoxes=driver.find_elements_by_class_name("text_field")
print(len(inputBoxes))

status=driver.find_element_by_id("RESULT_RadioButton-7_0").is_selected()
print(status)

#driver.find_element_by_id("RESULT_RadioButton-7_0").click()
'''WebDriverWait(driver,10).until(EC.element_to_be_clickable((By.ID,"RESULT_RadioButton-7_0"))).click()
status=driver.find_element_by_id("RESULT_RadioButton-7_0").is_selected()
print(status)
'''

element=driver.find_element_by_id("RESULT_RadioButton-9")
drp=Select(element)

drp.select_by_index("2")

list=drp.options

print(len(list))

for i in range(len(list)):
    print(list[i].text)