*** Settings ***
Documentation    This test suite is for login validation for the Student Registration System
...              Auhort: Neovern Enricoso
Library          SeleniumLibrary
Resource         ../resources/keywords.robot

*** Test Cases ***
Student Registration System
    [Documentation]    This test suite is for the Student Registration System
    ...                 for login validation,logout functionality, student search functionality and validation
    ...                 and activate/deactivate button functionality
    [Tags]     SRS-0001
    Open Login Page
    Verify Login Elements
    Verify Login validation
    Verify Search Elements
    Verify Search Functionality
    Verify Activate/Deactive button Functionality
    Verify Log out Functionality
    [TearDown]    Close Browser
