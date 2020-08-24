*** Settings ***
Documentation  Testing Apple Store page user-defined keywords
Library    FakerLibrary
Library  SeleniumLibrary
Library    String
Library     Collections
Library  Dialogs
Library     OperatingSystem
Library     BuiltIn
Variables           ../Variable/Variables.py
Variables           ../Locators/Locators.py

*** Keywords ***
Open the Browser
    Open Browser    url=${url}    browser=${browser}    alias=Browser1

Maximize the Browser
    Maximize Browser Window

Set Implicit Time
    Set Selenium Implicit Wait  15 seconds

Close browsers
    Close All Browsers

Click on Create Apple ID Link
    ${createlink} =     Call Method	${e}	get_createid_link
    Click Element    link:${createlink}

Enter the values in ID creation page
    [Documentation]  This user-defined keyword will help in entering the new user data on Apple Store Page
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

    ${fn} =     Call Method	${e}	get_firstname_xpath
    Set Selenium Timeout    20 seconds
    Wait Until Element Is Visible   xpath:${fn}
    Input Text  xpath:${fn}  ${firstname}

    ${ln} =     Call Method	${e}	get_lastname_xpath
    Input Text  xpath:${ln}  ${lastname}

    ${con} =     Call Method	${e}	get_country_xpath
    Run Keyword And Ignore Error    Select From List By Label   xpath:${con}    ${country}

    ${dob} =     Call Method	${e}	get_dob_xpath
    Input Text  xpath:${dob}  ${dateofbirth}

    ${eml} =     Call Method	${e}	get_email_xpath
    Input Text  xpath:${eml}  ${email}

    ${paswrd} =     Call Method	${e}	get_password_id
    Input Password  id:${paswrd}  ${password}

    ${cnfpaswrd} =     Call Method	${e}	get_confirmpassword_xpath
    Input Password  xpath:${cnfpaswrd}  ${password}

    ${concode} =     Call Method	${e}	get_countrycode_xpath
    Select From List By Label   xpath:${concode}    +91 (India)

    ${phnnum} =     Call Method	${e}	get_phonenumber_xpath
    Input Text  xpath:${phnnum}  ${phonenumber}

    Execute Javascript  window.scrollTo(0,document.body.scrollHeight)

    ${Captcha}=        Get Value From User     Enter Captcha
    ${cap} =     Call Method	${e}	get_captcha_xpath
    Input Text  xpath:${cap}  ${Captcha}

    ${continue} =     Call Method	${e}	get_continuebutton_classname
    Click Element   class:${continue}

    Create File    ${PATH}
    Append To File  ${PATH}    \n
    Append To File  ${PATH}    Success Message: Entering Data for Creation of Apple ID Process is Successful \n
    Append To File  ${PATH}    \n
    Append To File  ${PATH}    Below are the new user details: \n
    Append To File  ${PATH}    \n
    Append To File  ${PATH}    First Name: ${firstname} \n
    Append To File  ${PATH}    Last Name: ${lastname} \n
    Append To File  ${PATH}    Country: ${country} \n
    Append To File  ${PATH}    Date of Birth: ${dateofbirth} \n
    Append To File  ${PATH}    Email: ${email} \n
    Append To File  ${PATH}    Phone: ${phonenumber} \n
    Append To File  ${PATH}    \n
    Append To File  ${PATH}    ------------------------------------------------------------------------------------ \n
    Append To File  ${PATH}    \n
    sleep   5


Items Selection on Page
    [Documentation]  This user-defined keyword will help in selection of items on Apple Store Page
    Execute Javascript	window.open()
    Switch Window	locator=NEW
    Go To   ${url}

    ${ipadlink} =     Call Method	${e}	get_ipadlink_xpath
    Click Link    xpath:${ipadlink}

    Execute Javascript  window.scrollTo(0,document.body.scrollHeight)
    sleep   2
    Execute Javascript  window.scrollTo(0,-document.body.scrollHeight)
    sleep   3

    ${ipadminilink} =     Call Method	${e}	get_ipadminilink_xpath
    Click Link    xpath:${ipadminilink}

    Execute Javascript  window.scrollTo(0,2020)
    sleep   2
    Execute Javascript  window.scrollTo(0,-document.body.scrollHeight)
    sleep   5


SignIn with Valid Credentials
    [Documentation]  This user-defined keyword will help in sign with valid credentials on Apple Store Page
    Open Browser    ${url}    ${browser}    alias=Browser2
    Maximize the Browser
    Set Implicit Time

    ${baglink} =     Call Method	${e}	get_baglink_xpath
    Click Element    xpath:${baglink}

    Page Should Contain     ${message1}

    ${continuelink} =     Call Method	${e}	get_continuelink_xpath
    Click Element    xpath:${continuelink}

    ${username} =     Call Method	${e}	get_username_xpath
    Input Text  xpath:${username}  avengers8084@gmail.com

    ${pswrd} =     Call Method	${e}	get_password_xpath
    Input Password  xpath:${pswrd}  KillThanos8084

    ${signInbutton} =     Call Method	${e}	get_signIn_id
    Click Element    id:${signInbutton}

    Page Should Contain     ${message2}

    ${shopping} =     Call Method	${e}	get_shopping_xpath
    Click Element    xpath:${shopping}

    ${searching} =     Call Method	${e}	get_searching_xpath
    Click Element    xpath:${searching}

    ${item} =     Call Method	${e}	get_item_xpath
    Input Text  xpath:${item}  Apple Pencil
    Press Keys  xpath:${item}  RETURN

    ${accessories} =     Call Method	${e}	get_accessories_id
    Click Element    id:${accessories}

    ${brand} =     Call Method	${e}	get_brand_xpath
    Set Selenium Timeout    20 seconds
    Wait Until Element Is Visible   xpath:${brand}
    Click Element    xpath:${brand}

    ${company} =     Call Method	${e}	get_applecompany_xpath
    Click Element    xpath:${company}

    sleep   5
    Execute Javascript  window.scrollTo(0,document.body.scrollHeight)
    sleep   2
    Execute Javascript  window.scrollTo(0,500)
    sleep   2
    Execute Javascript  window.scrollTo(0,-document.body.scrollHeight)
    sleep   2



    ${baglink} =     Call Method	${e}	get_signbag_link
    Set Selenium Timeout    20 seconds
    Wait Until Element Is Visible   xpath:${baglink}
    Click Element    xpath:${baglink}

    ${signOut} =     Call Method	${e}	get_signout_xpath
    Click Element   xpath:${signOut}
    sleep   2
    
    
SignIn with Invalid Credentials
    [Documentation]  This user-defined keyword will help in login with invalid credentials on Apple Store Page
    ${baglink} =     Call Method	${e}	get_baglink_xpath
    Click Element    xpath:${baglink}
    
    ${signinlink} =     Call Method	${e}	get_signinlink_xpath
    Click Element    xpath:${signinlink}
    
    ${username} =     Call Method	${e}	get_username_xpath
    Input Text  xpath:${username}  avengers8084@gmail.com

    ${pswrd} =     Call Method	${e}	get_password_xpath
    Input Password  xpath:${pswrd}  KillThanos80845

    ${signInbutton} =     Call Method	${e}	get_signIn_id
    Click Element    id:${signInbutton}
    
    Page Should Contain     ${message4}
    sleep   2
    
    
Getting Locations
    [Documentation]  This user-defined keyword will help in getting URLs and Titles of opened browser pages
    Append To File  ${PATH}  Current Browser URLs \n
    Append To File  ${PATH}     -------------------------- \n
    Append To File  ${PATH}     \n
    @{currentBrowserLocation}=	Get Locations
    FOR     ${i}    IN  @{currentBrowserLocation}
       Append To File  ${PATH}  ${i} \n
       Append To File  ${PATH}     \n
    END

    Append To File  ${PATH}     \n
    Append To File  ${PATH}     ------------------------------------------------------------------------------------ \n
    Append To File  ${PATH}     \n

    Append To File  ${PATH}  All Opened Browser URLs \n
    Append To File  ${PATH}     ----------------------------------- \n
    Append To File  ${PATH}     \n
    @{allBrowsersLocation}=	Get Locations	browser=ALL
    FOR     ${i}    IN  @{allBrowsersLocation}
       Append To File  ${PATH}  ${i} \n
       Append To File  ${PATH}     \n
    END

    Append To File  ${PATH}     \n
    Append To File  ${PATH}     ------------------------------------------------------------------------------------ \n
    Append To File  ${PATH}     \n

    Append To File  ${PATH}  Current Browser Window Titles \n
    Append To File  ${PATH}     --------------------------------- \n
    Append To File  ${PATH}     \n
    @{currentBrowsertitles}=    Get Window Titles
    FOR     ${i}    IN  @{currentBrowsertitles}
       Append To File  ${PATH}  ${i} \n
       Append To File  ${PATH}     \n
    END

    Append To File  ${PATH}     \n
    Append To File  ${PATH}     ------------------------------------------------------------------------------------ \n
    Append To File  ${PATH}     \n


Embed the Text File
    [Documentation]  This user-defined keyword will help in embed the text file in the report
    Log  <a href="http://localhost:63342/Training/AppleDemo/TestSuite/results.txt">Results Data File<a>   html=True