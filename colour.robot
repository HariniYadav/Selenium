*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}   https://demo.nopcommerce.com/
${BLACK}    "\\033[30m"
${RED}  "\\033[31m"

*** Test Cases ***
ColourTest
    Log to console  Some Text in cyan and a ${red} in red

*** Keywords ***
Intialize Colors
    ${black}=   Evaluate    ${BLACK}
    Set Test Variable   ${black}
    ${red}=   Evaluate    ${RED}
    Set Test Variable   ${red}
