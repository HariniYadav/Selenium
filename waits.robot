*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}   http://demowebshop.tricentis.com/register

*** Test Cases ***
RegTest

    #${speed}=   get selenium speed
    #log to console  ${speed}
    open browser    ${url}  ${browser}
    maximize browser window
    ${impicitwait}= get selenium implicit wait
    log to console  ${implicitwait}
    #${time}=    get selenium timeout
    #log to console  ${time}
    #set selenium speed  2 seconds
    #set selenium timeout    10 seconds
    #wait until page contains    Registration   #max default wait is 5seconds
    #sleep  3
    set selenium implicit wait   10 seconds         #wait max of 10 seconds
    select radio button     Gender  M
    input text  name:FirstName  David
    input text  name:LastName   John
    input text  name:Email  anhc@gmail.com
    input text  name:Password   davidjohn
    input text  name:ConfirmPassword    davidjohn
    #${speed}=   get selenium speed
    #log to console  ${speed}

