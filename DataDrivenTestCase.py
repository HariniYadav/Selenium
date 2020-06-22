from Practice import XLutils
from selenium import webdriver

#interacting with the Chrome browser
driver=webdriver.Chrome(executable_path=r"C:\chromedriver.exe")

#opening the application
driver.get("http://newtours.demoaut.com/")

driver.maximize_window()

path="C:\\Users\\Narayana\Desktop\Harini\LoginTable.xlsx"

rows=XLutils.getRowCount(path,"Sheet1")

for r in range(2,rows+1):
    username=XLutils.readData(path,"Sheet1",r,1)
    password=XLutils.readData(path,"Sheet1",r,2)

    driver.find_element_by_name("userName").send_keys(username)
    driver.find_element_by_name("password").send_keys(password)

    driver.find_element_by_name("login").click()

    if driver.title=="Find a Flight: Mercury Tours:":
        print("test is passed")
        XLutils.writeData(path,"Sheet1",r,3,"test passed")
    else:
        print("test is failed")
        XLutils.writeData(path, "Sheet1", r, 3, "test failed")

    driver.find_element_by_link_text("Home").click()

'''
screeshot
driver.save_screeshot("C:\screenshot\homePage.png")
or
#above command can accept any .png/.jpg but below command accept only .png a warning comes but screenshot save as .jpg
driver.get_screenshot_as_file("C:\screenshot\homePage.jpg")'''