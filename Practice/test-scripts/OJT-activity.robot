*** Settings ***
Documentation    This test suite is for Student Registration System Functionality, validation
...              UI/UX, scenarios testing
...              Auhort: Neovern Enricoso
Library          SeleniumLibrary
Resource         ../resources/keywords.robot

*** Test Cases ***
Student Registration System
    [Documentation]    This test suite is for the Student Registration System
    ...                 for login validation,logout functionality, student search functionality and validation
    ...                 and activate/deactivate button functionality
    [Tags]     SRS-0001
    [Setup]    Open Login Page
    [TearDown]    Close Browser
    Verify Login Elements
    Verify Login validation
    Verify Search Elements
    Verify Search Functionality
    Verify Activate/Deactive button Functionality
    Verify Log out Functionality

test
    [Documentation]    This test suite is for the Student Registration System
    ...                 for login validation,logout functionality, student search functionality and validation
    ...                 and activate/deactivate button functionality
    [Tags]     SRS-0002
    Open Browser                     ${URL}     ${Browser}
    Maximize Browser Window
    Sleep    2s
    Input Text                        ${Username_field}           ${VALID_USERNAME}
    Input Password                    ${Password_field}           ${VALID_PASSWORD}
    Click Button                      ${Login_btn}
    Alert Should Be Present    text=Authentication successful!
    Sleep    1s
    Click Element    ${Student_list_btn}
    Verify Edit Functionality
    Close Browser