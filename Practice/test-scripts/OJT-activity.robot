*** Settings ***
Documentation    This test suite is for Student Registration System Functionality, validation
...              UI/UX, scenarios testing
...              Auhort: Neovern Enricoso
Library          SeleniumLibrary
Resource         ../resources/keywords.robot
Library          ../common/common.py

*** Test Cases ***
Student Registration System
    [Documentation]    This test suite is for the Student Registration System
    ...                 for login validation,logout functionality, student search functionality and validation
    ...                 and activate/deactivate button functionality in the masterlist page and enrollment functionality.
    [Tags]     SRS-0001
    [Setup]    Open Login Page
    [TearDown]    Close Browser
    Verify Login Elements
    Verify Login validation
    Verify Search Elements
    Verify Search Functionality
    Verify Activate/Deactive button Functionality
    Verify Enrollment functionality and UI/UX
    Verify Search Elements
    Verify New Enrolled Student
    Verify Log out Functionality

Web Scraping
    [Documentation]    This test suite is for the Web Scraping
    [Tags]     WS-0001
    [Setup]    Open Login Page
    Verify Login Elements
    ${loginbtn_tag}=    Get Loginbtn Tag    ${URL}
    ${username_tag}    ${password_tag}=    Get Input Tag    ${URL}
    Input text    ${username_tag}    qwerty
    Input Password    ${password_tag}    qwe
    Click button    ${loginbtn_tag}
    Log    ${username_tag}
    Log    ${password_tag}
    Log    ${loginbtn_tag}
    Sleep    5s
    [Teardown]    Close Browser

