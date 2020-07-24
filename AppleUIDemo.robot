*** Settings ***
Documentation  This is a test script to validate different use cases on Apple Store Page
Library    FakerLibrary
Library  SeleniumLibrary
Library    String
Library     Collections
Library  Dialogs
Suite Setup  Open the Browser
Suite Teardown  Close browsers
Test Setup  log   Started execution of test case
Test Teardown  log   Completion of executing the test case

*** Variables ***
${url}     https://appleid.apple.com/
${browser}  chrome

*** Test Cases ***
Apple UI Test
    Maximize the Browser
    Set Implicit Time
    Click on Create Apple ID Link
    Enter the values in ID creation page
    Items Selection Test
    SignIn Test
    


*** Keywords ***
Open the Browser
    open browser    ${url}    ${browser}

Maximize the Browser
    maximize browser window

Set Implicit Time
    set selenium implicit wait  15 seconds

Close browsers
    close all browsers

Click on Create Apple ID Link
    click link  link:Create Your Apple ID

Enter the values in ID creation page
    [Documentation]  This test is to validate whether the fake data is entering on the webpage or not
    ${firstname}=   FakerLibrary.First Name
    ${lastname}=   FakerLibrary.Last Name
    ${country}=     FakerLibrary.Country
    ${dateofbirthobject}=     FakerLibrary.Date Of Birth
    ${dateofbirthstring}=     convert to string   ${dateofbirthobject}
    @{dateofbirtharray}=     Split String	${dateofbirthstring}	-	2
    ${year}=    Get From List   ${dateofbirtharray}     0
    ${month}=    Get From List   ${dateofbirtharray}     1
    ${date}=    Get From List   ${dateofbirtharray}     2
    ${dateofbirth}=   convert to string  ${month} / ${date} / ${year}
    ${email}=   FakerLibrary.Ascii Company Email
    ${password}=    FakerLibrary.Password
    ${phonenumber}=     FakerLibrary.Phone Number
    input text  xpath://first-name-input[contains(@placeholder,'First name')]//div//input[contains(@class,'')]   ${firstname}
    input text  xpath://last-name-input[contains(@placeholder,'Last name')]//div//input[contains(@class,'')]    ${lastname}
    select from list by label   xpath://select[contains(@class,'form-dropdown country-picker idms-address-country')]    ${country}
    input text  xpath://input[contains(@class,'date date-input generic-input-field')]    ${dateofbirth}
    input text  xpath://input[contains(@class,'form-cell form-textbox form-textbox-text form-field email-field field-has-info')]    ${email}
    input text  id:password    ${password}
    input text  xpath://div[contains(@class,'password-input')]//idms-textbox//idms-error-wrapper//div//input[contains(@class,'override')]   ${password}
    select from list by label   xpath://div[contains(@class,'form-group phone-input')]//idms-dropdown//div//idms-error-wrapper//div//select[contains(@class,'')]    +91 (India)
    input text  xpath://div[contains(@class,'form-group phone-input')]//idms-textbox//idms-error-wrapper//div//input[contains(@class,'')]   ${phonenumber}
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    ${Captcha}=        Get Value From User     Enter Captcha      default value
    input text   xpath=//div[contains(@class,'captcha-input')]//idms-textbox//idms-error-wrapper//div//input[contains(@class,'')]   ${Captcha}
    click element   class:overflow-text
    Log to console    Entering Data for Creation of Apple ID Process is Successful
    sleep   3

Items Selection Test
    [Documentation]  This test is to validate selection of items is happening on the page or not
    Execute Javascript	window.open()
    Switch Window	locator=NEW
    Go To	https://appleid.apple.com/
    click link  xpath://a[@class='ac-gn-link ac-gn-link-ipad']
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    sleep   2
    execute javascript  window.scrollTo(0,-document.body.scrollHeight)
    sleep   2
    click link  xpath://li[@class='chapternav-item chapternav-item-ipad-mini']//a[@class='chapternav-link']
    execute javascript  window.scrollTo(0,2020)
    sleep   2
    execute javascript  window.scrollTo(0,-document.body.scrollHeight)

SignIn Test
    [Documentation]  This test is to validate proper sign with credentials is happening on the page or not
    Open the Browser
    Maximize the Browser
    Set Implicit Time
    click element   xpath://li[@class='ac-gn-item ac-gn-bag']//a[@class='ac-gn-link ac-gn-link-bag']
    click element   xpath://a[@class='button button-block button-super']
    input text  xpath://input[@name='recon-0-0']    avengers8084@gmail.com
    input text  xpath://input[@name='recon-0-1']    KillThanos8084
    click element   id:signInButtonId
    page should contain     Your bag is empty
    click element   xpath://a[@class='button button-block button-super button-secondary-alpha']
    click element   xpath://a[@class='ac-gn-link ac-gn-link-search']
    input text  xpath://input[@placeholder='Search apple.com']  Apple Pencil
    Press Keys  xpath://input[@placeholder='Search apple.com']  RETURN
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    sleep   2
    execute javascript  window.scrollTo(0,-document.body.scrollHeight)
    sleep   2
    click element   xpath://li[@class='ac-gn-item ac-gn-bag']//a[contains(@class,'ac-gn-link ac-gn-link-bag')]
    click element   xpath://a[@class='ac-gn-bagview-nav-link ac-gn-bagview-nav-link-signOut']










