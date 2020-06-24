*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}   https://demo.nopcommerce.com/LoginTest

*** Test Cases ***

    #create webdriver    Chrome    executable_path=C://chromedriver.exe
    open browser    ${url}  ${browser}
    maximize browser window

    title should be     nopCommerce demo store
    click link  xpath://a[@class='ico-login']
    ${"email_txt"}      set variable    id:Email
    element should be visible   ${"email_txt"}
    element should be enabled   ${"email_txt"}
    input text  ${"email_txt"}   pavantraining@gmail.com
    sleep   5
    clear element text  ${"email_txt"}
    sleep   3
    close browser

