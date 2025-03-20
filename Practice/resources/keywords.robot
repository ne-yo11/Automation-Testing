*** Settings ***
Documentation    This resource file contains keywords for the Student Registration System
...              Author: Neovern Enricoso
Library          SeleniumLibrary
Resource         ../Variables/variables.robot
Library          ../common/loginValidation.py
Library          ../common/SearchFunctionality.py
Library    ../.venv/Lib/site-packages/robot/libraries/XML.py
Library    ../.venv/Lib/site-packages/robot/libraries/OperatingSystem.py

*** Keywords ***
Open Login Page
    [Documentation]    This keyword is for opening the login page
    [Tags]             SRS-0001
    Open Browser                     ${URL}     ${Browser}
    Maximize Browser Window
    Sleep    2s

Verify Login Elements
    [Documentation]    This keyword is for verifying the login elements
    [Tags]             SRS-0001
    Page Should Contain Element       ${Username_field}
    Element Should Be Enabled         ${Username_field}
    Page Should Contain Element       ${Password_field}
    Element Should Be Enabled         ${Password_field}
    Page Should Contain Element       ${Login_btn}
    Element Should Be Enabled         ${Login_btn}

Verify Login validation
    [Documentation]    This keyword is for verifying the login validation
    [Tags]             SRS-0001
    FOR    ${username}            ${password}    IN
    ...    ${INVALID_USERNAME}    ${VALID_PASSWORD}
    ...    ${VALID_USERNAME}      ${INVALID_PASSWORD}
    ...    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    ...    ${VALID_USERNAME}      ${VALID_PASSWORD}
    Input Text                        ${Username_field}           ${username}
    Input Password                    ${Password_field}           ${password}
    ${result}=    loginvalidation     ${username}                 ${password}
    Log                               result: ${result}
    Click Button                      ${Login_btn}
    END
    Alert Should Be Present    text=Authentication successful!
    Sleep    1s

Verify Search Elements
    [Documentation]    This keyword is for verifying the search elements
    [Tags]             SRS-0001
    Page Should Contain Element     ${Student_list_btn}
    Click Element                   ${Student_list_btn}
    Page Should Contain Element     ${Search_Field}
    Element Should Be Enabled       ${Search_Field}
    Page Should Contain Element     ${Student_list_btn}
    Element Should Be Enabled       ${Student_list_btn}
    Page Should Contain Button      ${Search_reset_btn}
    Element Should Be Enabled       ${Search_reset_btn}
    Page Should Contain Element     ${Search_Category_field}
    Element Should Be Enabled       ${Search_Category_field}
    Page Should Contain Element     ${YearFilter_1styear_chkbox}
    Page Should Contain Element     ${YearFilter_2ndyear_chkbox}
    Page Should Contain Element     ${YearFilter_3rdyear_chkbox}
    Page Should Contain Element     ${YearFilter_4thyear_chkbox}
    Page Should Contain Element     ${Search_btn}
    Element Should Be Enabled       ${Search_btn}
    Page Should Contain Element     ${Table_student_masterlist}

Verify Search Functionality
    [Documentation]    This keyword is for verifying the search functionality
    [Tags]             SRS-0001
    Wait Until Element Is Visible   ${Table_column_student}
    Select Checkbox                 ${YearFilter_1styear_chkbox}
    Sleep    1s
    @{matching_courses}=            Get Filtered Course Codes      ${Test_search_Year_level}
    FOR    ${course}    IN    @{matching_courses}
        Table Should Contain    ${Table_student_masterlist}        ${course}
    END
    Click Button                    ${Search_reset_btn}
    Input Text                      ${Search_Field}                ${Test_search_invalid}
    Click Button                    ${Search_btn}
    Alert Should Be Present
    Click Button                    ${Search_reset_btn}
    Input Text                      ${Search_Field}                ${Testdata_search_name}
    Select From List By Label       ${Search_Category_field}       ${Testdata_search_Byname}
    Click Button                    ${Search_btn}
    Sleep    1s
    Table Should Contain            ${Table_student_masterlist}    ${Testdata_search_name}
   
Verify Activate/Deactive button Functionality
    [Documentation]    This keyword is for verifying the activate/deactivate button functionality
    [Tags]             SRS-0001
    Execute JavaScript    var table = document.querySelector(".table-scroll"); if (table) { table.scrollLeft = table.scrollWidth; }
    ${status}=    Run Keyword And Return Status    Element Should Contain    ${AccountStatus_column}    Inactive
    IF    ${status}
        Click Button                    ${Activate_btn}
        Sleep    1s
        Alert Should Be Present
        Alert Should Be Present
        Sleep    1s
        Input Text                      ${Search_Field}                ${Testdata_search_name}
        Select From List By Label       ${Search_Category_field}       ${Testdata_search_Byname}
        Sleep    0.5s
        Click Button                    ${Search_btn}
        Table Should Contain            ${Table_student_masterlist}    ${Testdata_search_name}
        Execute JavaScript    var table = document.querySelector(".table-scroll"); if (table) { table.scrollLeft = table.scrollWidth; }
        Element Should Contain          ${AccountStatus_column}        Active
        Sleep    5s
    ELSE
        Click Button                    ${Deactivate_btn}
        Sleep    1s
        Alert Should Be Present
        Alert Should Be Present
        Sleep    1s
        Input Text                      ${Search_Field}                ${Testdata_search_name}
        Select From List By Label       ${Search_Category_field}       ${Testdata_search_Byname}
        Sleep    0.5s
        Click Button                    ${Search_btn}
        Table Should Contain            ${Table_student_masterlist}    ${Testdata_search_name}
        Execute JavaScript    var table = document.querySelector(".table-scroll"); if (table) { table.scrollLeft = table.scrollWidth; }
        Element Should Contain          ${AccountStatus_column}        Inactive
        Sleep    5s
    END
    

Verify Log out Functionality
    [Documentation]    This keyword is for verifying the logout functionality
    [Tags]             SRS-0001
    Click Button                        ${Logout_btn}
    Alert Should Be Present