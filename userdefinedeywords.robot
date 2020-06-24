*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/resources.robot

*** Variables ***
${browser}  chrome
${url}   http://www.newtours.demoaut.com/

*** Test Cases ***
keywordtest
    ${apptitle}=    launchBrowser   ${url}  ${browser}
    log to console  ${apptitle}
    log     ${apptitle}
    input text  name:userName   mercury
    input text  name:password   mercury

