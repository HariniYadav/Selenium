*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
TC1 User Registration Test
    [Tags]  regression
    log to console  This is user registration test
    log to console  user registration test is over

TC1 LoginTest
    [Tags]  sanity
    log to console  This is login test
    log to console  login test is over

TC1 Change User Settings Test
    [Tags]  other
    log to console  This is change user settings test
    log to console  change user settings is over

TC1 Logout Test
    [Tags]  sanity
    log to console  This is logout test
    log to console  logout test is over

