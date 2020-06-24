*** Settings ***
Library  SeleniumLibrary
#Resource    ../Resources/Login_resources.robot
Suite Setup  Open my Browser
Suite Teardown  Close browsers
Test Setup  log to console  Execution of test case
Test Teardown  log to console   Completion of executing the test case
Test Template  Invalid Login


*** Variables ***
${BROWSER}  chrome
${LOGIN URL}  https://admin-demo.nopcommerce.com


*** Test Cases ***
Right user empty pwd    admin@yourstore.com     ${EMPTY}
Right user wrong pwd    admin@yourstore.com     xyz
Wrong user right pwd    adm@yourstore.com     admin
Wrong user empty pwd    admin@yourstore.com     ${EMPTY}
Wrong user wrong pwd    adm@yourstore.com     xyz


*** Keywords ***
Open my Browser
    open browser    ${LOGIN URL}    ${BROWSER}

Close browsers
    close all browsers

Open Login Page
    go to   ${LOGIN URL}

Input username
    [Arguments]  ${username}
    input text  id:Email    ${username}

Input password
    [Arguments]  ${password}
    input text  id:Password    ${password}

Click Login button
    click element  xpath://input[@class='button-1 login-button']

Click Logout button
    click link  Logout

Error message should be visible
    page should contain    Login was unsuccessful

Dashboard page should be visible
    page should contain     Dashboard

Invalid Login
    [Arguments]  ${username}    ${password}
    Input username  ${username}
    Input password  ${password}
    Click Login button
    Error message should be visible


