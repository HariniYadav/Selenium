*** Settings ***
Library  SeleniumLibrary
Library     PageObjectLibrary

*** Variables ***
${url}  https://the-internet.herokuapp.com/
${browser}  chrome

*** Settings ***
Library  SeleniumLibrary
Library     PageObjectLibrary

Suite Setup  open browser   ${url}  ${browser}
Suite Teardown  Close all browsers



*** Test Cases ***
ValidLoginTest
    [Documentation]  Verify that we can successfully log in to the internet
    [Setup]     Go to page     LoginPage
    maximize browser window
    Enter username  tomsmith
    Enter password  SuperSecretPassword!
    Click the login button
    sleep   2
    The current page should be  SecureAreaPage
    sleep   3
