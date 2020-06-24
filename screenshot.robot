*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}   https://opensource-demo.orangehrmlive.com/
*** Test Cases ***
ScreenShotTest
    open browser    ${url}  ${browser}
    maximize browser window

    input text  id:txtUsername  Admin
    input text  id:txtPassword   admin123

    capture element screenshot  xpath://*[@id="divLogo"]/img    C:/Users/Narayana/PycharmProjects/SeleniumPython/RobotFramework/logo.png
    capture page screenshot  Page.png

    close browser
