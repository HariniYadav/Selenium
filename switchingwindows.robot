*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}   http://demo.automationtesting.in/Windows.html
*** Test Cases ***
TabbedWindowsTest
    #create webdriver    Chrome    executable_path=C://chromedriver.exe
    open browser    ${url}  ${browser}
    maximize browser window
    click element   xpath://*[@id="Tabbed"]/a/button

    select window   title=Sakinalium | Home

    click element   xpath://*[@id="container"]/header/div/div/div[2]/ul/li[4]/a
    sleep   3
    close all browsers
    #handle multiple browsers
    open browser    https://www.google.com  ${browser}
    maximize browser window

    sleep   3

    open browser    https://www.bing.com  ${browser}
    maximize browser window

    switch browser  1
    ${title1}=  get title
    log to console  ${title1}

    switch browser  2
    ${title2}=  get title
    log to console  ${title2}

    sleep   3
    close all browsers


    open browser    https://www.google.com  ${browser}
    maximize browser window
    ${loc}=    get location
    log to console  ${loc}

    sleep   3


    go to   https://www.bing.com
    ${loc}=    get location
    log to console  ${loc}

    go back
    ${loc}=    get location
    log to console  ${loc}

    close all browsers




