*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}   https://swisnl.github.io/jQuery-contextMenu/demo.html
*** Test Cases ***
MouseTest
    #right click
    open browser    ${url}  ${browser}
    maximize browser window

    open context menu   xpath://span[@class='context-menu-one btn btn-neutral']
    sleep   3



    #double click
    go to   https://testautomationpractice.blogspot.com/
    maximize browser window
    double click element    xpath://button[contains(text(),'Copy Text')]
    sleep   3




    #drag and drop

    go to    http://www.dhtmlgoodies.com/scripts/drag-drop-custom/demo-drag-drop-3.html
    maximize browser window
    drag and drop    id:box6        id:box106
    sleep   3

    close all browsers

