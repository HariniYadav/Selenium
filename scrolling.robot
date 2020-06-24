*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://www.countries-ofthe-world.com/flags-of-the-world.html

*** Test Cases ***
Scrollingtest

    open browser    ${url}  ${browser}
    maximize browser window

    #execute javascript  window.scrollTo(0,1500)

    #scroll element into view    xpath://*[@id="content"]/div[2]/div[2]/table[1]/tbody/tr[86]/td[1]/img

    #end of page
    execute javascript  window.scrollTo(0,document.body.scrollHeight)

    sleep   5

    #starting of page
    execute javascript  window.scrollTo(0,-document.body.scrollHeight)

