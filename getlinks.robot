*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}   http://www.newtours.demoaut.com/

*** Test Cases ***
GetAllLinkTest
    open browser    ${url}  ${browser}
    maximize browser window
    ${alllinkscount}=   get element count   xpath://a
    log to console  ${alllinkscount}

    #@{LinkItems}=   create list

    FOR     ${i}    IN RANGE    1   ${alllinkscount}+1
    \   ${linktext}=    get text    xpath:(//a)[${i}]
    \   Log to console  ${linktext}