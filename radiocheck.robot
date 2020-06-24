*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}   https://fs2.formsite.com/meherpavan/form2/index.html?1537702596407
#${radio}   xpath=//*[@id="RESULT_RadioButton-7_1"]

*** Test Cases ***
Testing Radio Buttons and Check Boxes
    open browser    ${url}  ${browser}
    maximize browser window
    set selenium speed      2seconds






    select from list by label   RESULT_RadioButton-9    Morning
    sleep   3
    select from list by index   RESULT_RadioButton-9   3
