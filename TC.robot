*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${browser}  chrome
${url}   https://demo.nopcommerce.com/
*** Test Cases ***
LoginTest
    #create webdriver    Chrome    executable_path=C://chromedriver.exe
    open browser    ${url}  ${browser}
    maximize browser window
    title should be     nopCommerce demo store
    loginToApplication
    close browser

*** Keywords ***
loginToApplication
    click link  xpath://a[@class='ico-login']
    input text  id:Email    pavantraining@gmail.com
    input text  id:Password     Test@123
    click element   xpath://input[@class="button-1 login-button"]