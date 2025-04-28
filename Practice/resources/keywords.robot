*** Settings ***
Documentation    This resource file contains keywords for the Student Registration System
...              Author: Neovern Enricoso
Library          SeleniumLibrary
Resource         ../Variables/variables.robot
Library          ../common/loginValidation.py
Library          ../common/SearchFunctionality.py
Library          ../common/common.py

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
    ${elements}=       Create List     ${Username_field}    ${Password_field}    ${Login_btn}
    FOR    ${element}    IN    @{elements}
        Page Should Contain Element    ${element}
        Element Should Be Enabled      ${element}
    END
Verify Log out Functionality
    [Documentation]    This keyword is for verifying the logout functionality
    [Tags]             SRS-0001
    Click Button                      ${Logout_btn}
    Sleep    1s
    Alert Should Be Present

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
    Click Element    ${Student_list_btn}
    ${elements}=       Create List       
    ...    ${Search_Field}    
    ...    ${Search_Category_field}  
    ...    ${Search_btn}    
    ...    ${Search_reset_btn}    
    ${checkbox}=       Create List
    ...    ${YearFilter_1styear_chkbox}    
    ...    ${YearFilter_2ndyear_chkbox}    
    ...    ${YearFilter_3rdyear_chkbox}    
    ...    ${YearFilter_4thyear_chkbox}  
    FOR    ${element}    IN    @{elements}
        Page Should Contain Element    ${element}
        Element Should Be Enabled      ${element}
    END
    FOR    ${check}    IN    @{checkbox}
        Page Should Contain Element    ${check}
    END
    Page Should Contain Element        ${Table_student_masterlist}

Verify Search Functionality
    [Documentation]    This keyword is for verifying the search functionality
    [Tags]             SRS-0001
    Wait Until Element Is Visible   ${Table_column_student}
    Select Checkbox                 ${YearFilter_1styear_chkbox}
    Sleep    1s
    @{matching_courses}=            Get Filtered Course Codes      ${Test_search_Year_level}
    FOR    ${course}    IN    @{matching_courses}
        Table Should Contain        ${Table_student_masterlist}    ${course}
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
        ${pop_text}=                    Handle Alert                   ACCEPT
        ${display_text}=                Student Code From Popup        ${pop_text}
        Log                             StudentCode: ${display_text}
        Alert Should Be Present
        Sleep    1s
        Input Text                      ${Search_Field}                ${Testdata_search_name}
        Select From List By Label       ${Search_Category_field}       ${Testdata_search_Byname}
        Sleep    0.5s
        Click Button                    ${Search_btn}
        Table Should Contain            ${Table_student_masterlist}    ${Testdata_search_name}
        Execute JavaScript    var table = document.querySelector(".table-scroll"); if (table) { table.scrollLeft = table.scrollWidth; }
        Element Should Contain          ${AccountStatus_column}        Active
        Sleep    2s
    ELSE
        Click Button                    ${Deactivate_btn}
        Sleep    1s
        ${pop_text}=                    Handle Alert                   ACCEPT
        ${display_text}=                Student Code From Popup        ${pop_text}
        Log                             StudentCode: ${display_text}
        Alert Should Be Present
        Sleep    1s
        Input Text                      ${Search_Field}                ${Testdata_search_name}
        Select From List By Label       ${Search_Category_field}       ${Testdata_search_Byname}
        Sleep    0.5s
        Click Button                    ${Search_btn}
        Table Should Contain            ${Table_student_masterlist}    ${Testdata_search_name}
        Execute JavaScript    var table = document.querySelector(".table-scroll"); if (table) { table.scrollLeft = table.scrollWidth; }
        Element Should Contain          ${AccountStatus_column}        Inactive
        Sleep    2s
        Click Button                    ${Search_reset_btn}
    END

Verify Enrollment functionality and UI/UX
    [Documentation]    This keyword is for verifying the Student Enrollment Elements and functionality
    [Tags]             SRS-0001
    Click Element                        ${Enrollment_btn}
    ${First_elements}=                  Create List
    ...               ${Firstname_field}
    ...               ${Firstname_label}
    ...               ${Lastname_field}
    ...               ${Lastname_label}
    ...               ${Middlename_field}
    ...               ${Middlename_label}
    ...               ${Birthdate_field}
    ...               ${Birthdate_label}
    FOR    ${element}    IN    @{First_elements}
        Page Should Contain Element    ${element}
        Element Should Be Enabled      ${element}
    END
    Input Text                          ${Firstname_field}        ${Firstname}
    Input Text                          ${Middlename_field}       ${Middlename}
    Input Text                          ${Lastname_field}         ${Lastname}
    Input Text                          ${Birthdate_field}        ${Birthdate}
    Execute JavaScript    window.scrollBy({ top: 300, behavior: 'smooth' });
    Page Should Contain Element          ${Age_field}
    Page Should Contain Element          ${Age_label}
    Element Should Be Disabled           ${Age_field}
    ${Second_element}=                   Create List
    ...                ${Gender_DD}
    ...                ${Gender_label}
    ...                ${Address_field} 
    ...                ${Address_label}
    ...                ${Contact_field}
    ...                ${Contact_label}
    ...                ${GuardianName_field}
    ...                ${GuardianName_label}
    ...                ${GuardianAddress_field}
    ...                ${GuardianAddress_label}
    ...                ${GuardianContact_field}
    ...                ${GuardianContact_label}
    FOR    ${element}    IN    @{Second_element}
        Page Should Contain Element    ${element}
        Element Should Be Enabled      ${element}
    END 
    Select From List By Label           ${Gender_DD}                ${Gender}
    Input Text                          ${Address_field}            ${Address}
    Input Text                          ${Contact_field}            ${Contact}
    Input Text                          ${GuardianName_field}       ${GuardianName}
    Input Text                          ${GuardianAddress_field}    ${GuardianAddress}
    Input Text                          ${GuardianContact_field}    ${GuardianContact}
    Execute JavaScript    window.scrollBy({ top: 500, behavior: 'smooth' });
    Page Should Contain Element          ${CourseCode_field}
    Page Should Contain Element          ${CourseCode_label}
    Element Should Be Disabled           ${CourseCode_field}
    ${Third_element}=             Create List
    ...                ${Course_DD}
    ...                ${Course_label}
    ...                ${CourseStatus_DD}
    ...                ${CourseStatus_label}
    ...                ${Hobby_field}
    ...                ${Hobby_label}
    ...                ${Document_field}
    ...                ${Document_label}
    ...                ${Register_btn} 
    FOR    ${element}    IN    @{Third_element}
        Page Should Contain Element    ${element}
        Element Should Be Enabled      ${element}
    END 
    Select From List By Label           ${CourseStatus_DD}                ${CourseStatus}
    Select From List By Label           ${Course_DD}                      ${CourseName}
    Input Text                          ${Hobby_field}                    ${Hobby}
    Choose File                         ${Document_field}                 ${Document_filepath}
    Execute JavaScript    window.scrollBy({ top: 1000, behavior: 'smooth' });
    Click Button                        ${Register_btn}
    Sleep   2s
    Click Button                        ${Register_message}

Verify New Enrolled Student
    [Documentation]    This keyword is to verify if the newly enrolled student exist 
    [Tags]             SRS-0001
    Input Text                      ${Search_Field}                ${Firstname}
    Select From List By Label       ${Search_Category_field}       ${Testdata_search_Byname}
    Click Button                    ${Search_btn}
    Sleep    5s
Verify Enrollment Field Validation
    [Documentation]    This keyword is to verify the enrollment field validation
    [Tags]             SRS-0001
    Execute JavaScript    window.scrollBy({ top: 300, behavior: 'smooth' });
    Input Text                          ${Firstname_field}           ${Firstname_Validation}
    ${firstname_error}=                 Get Value                     ${Firstname_field}
    Run keyword and continue on failure    Should Be Empty            ${firstname_error}
    Input Text                          ${Middlename_field}          ${Middlename_Validation}
    ${middlename_error}=                Get Value                     ${Middlename_field}
    Run keyword and continue on failure        Should Be Empty                     ${middlename_error}
    Input Text                          ${Lastname_field}             ${Lastname_Validation}
    ${lastname_error}=                  Get Value                     ${Lastname_field}
    Run keyword and continue on failure    Should Be Empty                     ${lastname_error}
    Execute JavaScript    window.scrollBy({ top: 300, behavior: 'smooth' });
    Input Text                          ${Birthdate_field}           ${Birthdate_Validation}
    ${birthdate_error}=                 Get Value                     ${Birthdate_field}
    Run keyword and continue on failure    Should Be Empty                     ${birthdate_error}
    Input Text                          ${Contact_field}             ${Contact_Validation}
    Page Should Contain Element               ${Contact_error_message}
    Execute JavaScript    window.scrollBy({ top: 200, behavior: 'smooth' });
    Sleep    5s

Verify Edit Functionality
    [Documentation]    This keyword is for verifying the edit/update functionality
    ...                 for the student information.
    ...                 I will change the last name of the student and check if the changes are saved
    [Tags]             SRS-0001
    Click Button                    ${Search_reset_btn}
    Input Text                      ${Search_Field}                ${Testdata_search_name}
    Select From List By Label       ${Search_Category_field}       ${Testdata_search_Byname}
    Sleep    0.5s
    Click Button                    ${Search_btn}
    Table Should Contain            ${Table_student_masterlist}    ${Testdata_search_name}
    Execute JavaScript    var table = document.querySelector(".table-scroll"); if (table) { table.scrollLeft = table.scrollWidth; }
    Click Button                     ${Edit_btn}
    Input Text                       ${Lastname_field_update}        ${Testdata_update_lastname}
    Click Button                     ${Save_changes_btn}
    Alert Should Be Present
    Input Text                      ${Search_Field}                ${Testdata_search_name}
    Select From List By Label       ${Search_Category_field}       ${Testdata_search_Byname}
    Sleep    0.5s
    Click Button                    ${Search_btn}
    ${lastname}=    Get Text        ${Lastname_column_table}
    Should Be Equal As Strings      ${lastname}    ${Testdata_update_lastname}
    Sleep    5s



