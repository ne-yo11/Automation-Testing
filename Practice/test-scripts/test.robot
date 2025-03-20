*** Settings ***
Documentation    This is a sample test is to login to the website
...              https://quizcrossmindmaster.pythonanywhere.com
...              Author: Neovern Enricosooo
Library    SeleniumLibrary
#Resource    ../resources/keywords.robot

*** Variables ***
${BROWSER}    Chrome
${Email}    neovern07@gmail.com
${Password}    qweqwe123

*** Keywords ***

    
*** Test Cases ***
Sample Test
    Set Selenium Speed    value=1
    Open Browser    https://quizcrossmindmaster.pythonanywhere.com   ${BROWSER}
    Maximize Browser Window
    Input Text    xpath=//form[@id='loginForm']//input[@placeholder='Email']    ${Email}
    Input Password    xpath=//form[@id='loginForm']//input[@placeholder='Password']    ${Password}
    Click Button    xpath=//button[normalize-space()='LOGIN']
    Wait Until Element Contains    xpath=//a[normalize-space()='View Class']    View Class
    Mouse Over    xpath=//a[normalize-space()='View Class']
    Sleep    10s
    Close Browser

Second test
    Set Selenium Speed    1
    Open Browser    https://www.youtube.com/  ${BROWSER}
    Maximize Browser Window
    Input Text       xpath=//input[@placeholder='Search']    Drunk text karaoke
    Press Keys       xpath=//input[@placeholder='Search']    ENTER
    Sleep    5s
    Page Should Contain    Henry Moodie - drunk text (Karaoke Version)
    Click Element    locator=//yt-formatted-string[normalize-space()='Henry Moodie - drunk text (Karaoke Version)']
    Sleep    10s
    Click Element    xpath=//button[@title='Full screen (f)']
    Sleep    20s
    Close Browser