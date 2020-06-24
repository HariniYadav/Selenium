*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url1}   https://demo.nopcommerce.com/
${url2}     http://demowebshop.tricentis.com/register
*** Test Cases ***
LoginTest

    open browser    ${url1}  ${browser}
    maximize browser window

    open browser    ${url2}  ${browser}
    maximize browser window

    close browser  #close latest opened one
    close all browsers