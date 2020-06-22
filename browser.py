from selenium import webdriver

driver=webdriver.Chrome(executable_path=r"C:\chromedriver.exe")
driver.maximize_window()
driver.get("https://admin-demo.nopcommerce.com/admin/")
print(driver.title)
driver.close()