*** Settings ***
Documentation  Testing to validate different use cases on Apple Store Page
Resource            ../Keyword/Keywords.robot
Variables           ../Variable/Variables.py
Variables           ../Locators/Locators.py
Suite Setup  Open the Browser
Suite Teardown  Close browsers

*** Test Cases ***
TestCase1: Creating Apple ID for a new user and doing some item selection Test
    [Documentation]  This testcase validates the data entry scenario and item selections scenario on Apple Store Page
    [Tags]  Creation
    Maximize the Browser
    Set Implicit Time
    Click on Create Apple ID Link
    Enter the values in ID creation page
    Items Selection on Page

TestCase2: Login with valid and invalid credentials Test
    [Documentation]  This testcase validates the login scenario with both valid and invalid credentials on Apple Store Page
    [Tags]  LogIn
    SignIn with Valid Credentials
    SignIn with Invalid Credentials

TestCase3: Getting Locations Test
    [Documentation]  This testcase will enter the details of opened browser pages in the test file
    [Tags]  Locations
    Getting Locations

TestCase4: Embed File Test
    [Documentation]  This testcase will embed the text file into report
    [Tags]  Embed
    Embed the Text File