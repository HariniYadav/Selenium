*** Settings ***
Documentation  This is a test script to validate different use cases on Apple Store Page
Library    FakerLibrary
Library  SeleniumLibrary
Library    String
Library     Collections
Library  Dialogs
Library     OperatingSystem
Suite Setup  Open the Browser
Suite Teardown  Close browsers
Test Setup  Log   Started execution of test case
Test Teardown  Log   Completion of executing the test case

*** Variables ***
${url}     https://appleid.apple.com/
${browser}  chrome
${PATH}           ${CURDIR}/results.txt

*** Test Cases ***
Apple UI Test
    Maximize the Browser
    Set Implicit Time
    Click on Create Apple ID Link
    Enter the values in ID creation page
    Items Selection Test
    SignIn Test
    Invalid Credential Test
    Locations Test
    Embed File Text

*** Keywords ***
Open the Browser
    Open Browser    ${url}    ${browser}    alias=Browser1

Maximize the Browser
    Maximize Browser Window

Set Implicit Time
    Set Selenium Implicit Wait  15 seconds

Close browsers
    Close All Browsers

Click on Create Apple ID Link
    Click Link  link:Create Your Apple ID

Enter the values in ID creation page
    [Documentation]  This test is to validate whether the fake data is entering on the webpage or not
    ${firstname}=   FakerLibrary.First Name
    ${lastname}=   FakerLibrary.Last Name
    ${country}=     FakerLibrary.Country
    ${dateofbirthobject}=     FakerLibrary.Date Of Birth
    ${dateofbirthstring}=     Convert To String   ${dateofbirthobject}
    @{dateofbirtharray}=     Split String	${dateofbirthstring}	-	2
    ${year}=    Get From List   ${dateofbirtharray}     0
    ${month}=    Get From List   ${dateofbirtharray}     1
    ${date}=    Get From List   ${dateofbirtharray}     2
    ${dateofbirth}=   Convert To String  ${month} / ${date} / ${year}
    ${email}=   FakerLibrary.Ascii Company Email
    ${password}=    FakerLibrary.Password
    ${phonenumber}=     FakerLibrary.Phone Number
    Input Text  xpath://first-name-input//input[@type='text']  ${firstname}
    Input Text  xpath://last-name-input//input[@type='text']    ${lastname}
    Select From List By Label   xpath://select[contains(@class,'form-dropdown country-picker')]    ${country}
    Input Text  xpath://input[contains(@class,'date date-input generic-input-field')]    ${dateofbirth}
    Input Text  xpath://input[contains(@class,'form-field email-field field-has-info')]    ${email}
    Input Password  id:password    ${password}
    Input Password  xpath://confirm-password-input//input[@type='password']  ${password}
    Select From List By Label   xpath://div[contains(@class,'form-group phone-input')]//select[contains(@class,'')]    +91 (India)
    Input Text  xpath://idms-textbox//input[@type='tel']   ${phonenumber}
    Execute Javascript  window.scrollTo(0,document.body.scrollHeight)
    ${Captcha}=        Get Value From User     Enter Captcha      default value
    Input Text   xpath=//captcha-input//input[@type='text']   ${Captcha}
    Click Element   class:overflow-text
    Create File    ${PATH}
    Append To File  results.txt     \n
    Append To File  results.txt     Success Message: Entering Data for Creation of Apple ID Process is Successful \n
    Append To File  results.txt     \n
    Append To File  results.txt     Below are the new user details: \n
    Append To File  results.txt     \n
    Append To File  results.txt     First Name: ${firstname} \n
    Append To File  results.txt     Last Name: ${lastname} \n
    Append To File  results.txt     Country: ${country} \n
    Append To File  results.txt     Date of Birth: ${dateofbirth} \n
    Append To File  results.txt     Email: ${email} \n
    Append To File  results.txt     Mobile: ${phonenumber} \n
    Append To File  results.txt     \n
    Append To File  results.txt     ------------------------------------------------------------------------------------ \n
    Append To File  results.txt     \n
    sleep   2

Items Selection Test
    [Documentation]  This test is to validate selection of items is happening on the page or not
    Execute Javascript	window.open()
    Switch Window	locator=NEW
    Go To	https://appleid.apple.com/
    Click Link  xpath://a[@class='ac-gn-link ac-gn-link-ipad']
    Execute Javascript  window.scrollTo(0,document.body.scrollHeight)
    sleep   2
    Execute Javascript  window.scrollTo(0,-document.body.scrollHeight)
    sleep   2
    Click Link  xpath://li[@class='chapternav-item chapternav-item-ipad-mini']//a[@class='chapternav-link']
    Execute Javascript  window.scrollTo(0,2020)
    sleep   2
    Execute Javascript  window.scrollTo(0,-document.body.scrollHeight)
    sleep   2

SignIn Test
    [Documentation]  This test is to validate proper sign with credentials is happening on the page or not
    Open Browser    ${url}    ${browser}    alias=Browser2
    Maximize the Browser
    Set Implicit Time
    Click Element   xpath://li[@class='ac-gn-item ac-gn-bag']//a[@class='ac-gn-link ac-gn-link-bag']
    Page Should Contain     Sign in to see if you have any saved items. Or continue shopping
    Click Element   xpath://a[@class='button button-block button-super']
    Input Text  xpath://input[@name='recon-0-0']    avengers8084@gmail.com
    Input Text  xpath://input[@name='recon-0-1']    KillThanos8084
    Click Element   id:signInButtonId
    Page Should Contain     Your bag is empty
    Click Element   xpath://a[@class='button button-block button-super button-secondary-alpha']
    Click Element   xpath://a[@class='ac-gn-link ac-gn-link-search']
    Input Text  xpath://input[@id='ac-gn-searchform-input']  Apple Pencil
    Press Keys  xpath://input[@id='ac-gn-searchform-input']  RETURN
    Click Element   id:accessories
    Set Selenium Timeout    20 seconds
    Wait Until Element Is Visible   xpath://span[@class='as-search-accordion-title'][contains(text(),'Brand')]
    Click Element   xpath://span[@class='as-search-accordion-title'][contains(text(),'Brand')]
    Click Element   xpath://span[contains(@class,'as-search-filter-text')][text()='Apple']
    Execute Javascript  window.scrollTo(0,document.body.scrollHeight)
    sleep   2
    Execute Javascript  window.scrollTo(0,500)
    sleep   2
    Execute Javascript  window.scrollTo(0,-document.body.scrollHeight)
    sleep   2
    Click Element   xpath:/html[1]/body[1]/div[2]/div[4]/div[3]/div[2]/div[1]/div[1]/div[4]/div[2]/div[1]/div[2]/div[2]/h2[1]/a[1]/span[1]
    Set Selenium Timeout    20 seconds
    Wait Until Element Is Visible   xpath://span[contains(text(),'Add to Bag')]
    Click Element   xpath://span[contains(text(),'Add to Bag')]
    Page Should Contain  Review your bag
    Scroll Element Into View    xpath://button[@id='shoppingCart.actions.checkout']
    sleep   2
    Scroll Element Into View    xpath://span[contains(text(),'Remove')]
    Click Element   xpath://span[contains(text(),'Remove')]
    sleep   2
    Set Selenium Timeout    20 seconds
    Wait Until Element Is Visible   xpath://li[@class='ac-gn-item ac-gn-bag']//a[@class='ac-gn-link ac-gn-link-bag']
    Click Element   xpath://li[@class='ac-gn-item ac-gn-bag']//a[@class='ac-gn-link ac-gn-link-bag']
    Click Element   xpath://a[@class='ac-gn-bagview-nav-link ac-gn-bagview-nav-link-signOut']
    sleep   2

Invalid Credential Test
    [Documentation]  This test is to validate negative scenario using negative credential
    Click Element   xpath://li[@class='ac-gn-item ac-gn-bag']//a[@class='ac-gn-link ac-gn-link-bag']
    Click Element   xpath://a[@class='ac-gn-bagview-nav-link ac-gn-bagview-nav-link-signIn']
    Input Text  xpath://input[@name='recon-0-0']    avengers8084@gmail.com
    Input Text  xpath://input[@name='recon-0-1']    KillThanos80845
    Click Element   id:signInButtonId
    Page Should Contain     Your account information was entered incorrectly
    sleep   2

Locations Test
    [Documentation]  This test is to get the URLs and title of all opened browse pages
    Append To File  results.txt  Current Browser URLs \n
    Append To File  results.txt     \n
    @{currentBrowserLocation}=	Get Locations
    FOR     ${i}    IN  @{currentBrowserLocation}
       Append To File  results.txt  ${i} \n
       Append To File  results.txt     \n
    END

    Append To File  results.txt     \n
    Append To File  results.txt     ------------------------------------------------------------------------------------ \n
    Append To File  results.txt     \n

    Append To File  results.txt  Opened Browser URLs \n
    Append To File  results.txt     \n
    @{allBrowsersLocation}=	Get Locations	browser=ALL
    FOR     ${i}    IN  @{allBrowsersLocation}
       Append To File  results.txt  ${i} \n
       Append To File  results.txt     \n
    END

    Append To File  results.txt     \n
    Append To File  results.txt     ------------------------------------------------------------------------------------ \n
    Append To File  results.txt     \n

    Append To File  results.txt  Browser1 Window Titles \n
    Append To File  results.txt     \n
    @{currentBrowsertitles}=    Get Window Titles   browser=Browser1
    FOR     ${i}    IN  @{currentBrowsertitles}
       Append To File  results.txt  ${i} \n
       Append To File  results.txt     \n
    END

    Append To File  results.txt     \n
    Append To File  results.txt     ------------------------------------------------------------------------------------ \n
    Append To File  results.txt     \n

    Append To File  results.txt  Browser2 Window Titles \n
    Append To File  results.txt     \n
    @{allBrowserstitles}=   Get Window Titles   browser=Browser2
    FOR     ${i}    IN  @{allBrowserstitles}
       Append To File  results.txt  ${i} \n
       Append To File  results.txt     \n
    END

    Append To File  results.txt     \n
    Append To File  results.txt     ------------------------------------------------------------------------------------ \n
    Append To File  results.txt      \n


Embed File Text
    [Documentation]  This test is to embed the results.txt file in the Reports
    Log  <a href="http://localhost:63342/Training/Apple/results.txt">Results Data File<a>   html=True
