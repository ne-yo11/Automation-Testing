*** Variables *** 
#<------------------OTHERS------------------>
${URL}                          http://localhost:4200/login
${Browser}                      Chrome
${Logo}                         xpath=//img[@class='logo']

#<-----------------Test Data -------------------->
${VALID_USERNAME}                admin
${VALID_PASSWORD}                admin
${INVALID_USERNAME}              qwerty
${INVALID_PASSWORD}              123456
${Firstname}                     Selena
${Lastname}                      Gomez
${Middlename}                    Joro
${Birthdate}                     29122001
${Gender}                        Male
${Address}                       Jampang China
${Contact}                       +63933242344
${GuardianName}                  John Abad Joro
${GuardianAddress}               China
${GuardianContact}               +63933242344
${CourseName}                    Testing course
${CourseStatus}                  Enrolled
${Hobby}                         Boxing
${Document_filepath}             C:/Users/DEVOJT/Downloads/Sung Jinwoo _ Solo Leveling.jfif
${Firstname_Validation}          12312
${Middlename_Validation}         123123
${Lastname_Validation}           12313
${Birthdate_Validation}          asdfasdf
${Address_Validation}            Jampang China
${Contact_Validation}            +639332sd
${GuardianName_Validation}       Jsadasd
${GuardianAddress_Validation}    China
${GuardianContact_Validation}    +6393sadadasd
${Testdata_search_name}          Many
${Test_search_Year_level}        1st Year
${Testdata_search_Byname}        By Student Name
${Test_search_invalid}           asdfasdf
${Testdata_update_lastname}      pakyaw

#<------------------LOGIN-------------------->
${Username_field}               xpath=//input[@placeholder='Username']
${Password_field}               xpath=//input[@placeholder='Password']
${Login_btn}                    xpath=//button[normalize-space()='Login']
${Error_message}                xpath=//div[@class='error-message']xpath=//input[@placeholder='🔍 Search All Data']

#<------------------Navigation------------------->
${Dashboard_btn}                xpath=//a[normalize-space()='Dashboard']
${Student_list_btn}             xpath=//a[normalize-space()='Student Master List']
${Enrollment_btn}               xpath=//a[normalize-space()='Enrollment']
${Course_btn}                   xpath=//a[normalize-space()='Course Master List']
${Logout_btn}                   xpath=//button[normalize-space()='Log Out']

#<---------------Student Master list------------------>
${YearFilter_1styear_chkbox}    xpath=(//input[@type='checkbox'])[1]
${YearFilter_2ndyear_chkbox}    xpath=(//input[@type='checkbox'])[2]
${YearFilter_3rdyear_chkbox}    xpath=(//input[@type='checkbox'])[3]
${YearFilter_4thyear_chkbox}    xpath=(//input[@type='checkbox'])[4]
${Search_Category_field}        xpath=//select[@class='ng-untouched ng-pristine ng-valid']
${Table_column_student}         xpath=//td[normalize-space()='SC25-0001']
${Search_Field}                 xpath=//input[@placeholder='🔍 Search Here']
${Search_reset_btn}             xpath=//button[contains(text(),'🔄 Reset')]
${Table_student_masterlist}     css=.table-scroll
${AccountStatus_column}         css=tbody tr:nth-child(1) td:nth-child(18)
${Search_btn}                   xpath=//button[contains(text(),'🔎 Search')]
${Edit_btn}                     xpath=(//button[@class='edit-btn'][contains(text(),'✏️ Edit')])[1]
${Save_changes_btn}             xpath=//button[@type='submit']
${Activate_btn}                 xpath=//button[contains(text(),'🔄 Activate')]
${Deactivate_btn}               xpath=(//button[@class='remove-btn'][contains(text(),'🔴 Deactivate')])[1]
${Lastname_field_update}        xpath=//input[@id='lastname']
${Lastname_column_table}        css=tbody tr td:nth-child(3)

#<--------------Enrollment------------------>
${Firstname_field}             xpath=//input[@formcontrolname='firstName']
${Firstname_label}             xpath=//div[@class='masterlist-container']//div[1]//label[1]
${Middlename_field}            xpath=//input[@formcontrolname='middleName']
${Middlename_label}            xpath=//label[normalize-space()='Middle Name:']
${Lastname_field}              xpath=//input[@formcontrolname='lastName']    
${Lastname_label}              xpath=//label[normalize-space()='Last Name:']
${Birthdate_field}             xpath=//input[@type='date']
${Birthdate_label}             xpath=//label[normalize-space()='Birthdate:']
${Age_field}                   xpath=//input[@type='number']
${Age_label}                   xpath=//label[normalize-space()='Age:']
${Gender_DD}                   xpath=//select[@formcontrolname='gender']
${Gender_label}                xpath=//label[normalize-space()='Gender:']
${Address_field}               xpath=//input[@formcontrolname='address']
${Address_label}               xpath=//label[normalize-space()='Address:']
${Contact_field}               xpath=//input[@formcontrolname='Contact']
${Contact_label}               xpath=//label[normalize-space()='Contact Number:']
${GuardianName_field}          xpath=//input[@formcontrolname='guardianName']
${GuardianName_label}          xpath=//div[@class='masterlist-container']//div[1]//label[1]
${GuardianAddress_field}       xpath=//input[@formcontrolname='guardianAddress']
${GuardianAddress_label}       xpath=//label[normalize-space()='Guardian Address:']
${GuardianContact_field}       xpath=//input[@formcontrolname='guardianContact']
${GuardianContact_label}       xpath=//label[normalize-space()='Guardian Contact Number:']
${Course_DD}                   xpath=//select[@formcontrolname='courseName']
${Course_label}                xpath=//label[normalize-space()='Course Name:']
${CourseCode_field}            xpath=//input[@formcontrolname='courseCode']
${CourseCode_label}            xpath=//label[normalize-space()='Course Code:']
${CourseStatus_DD}             css=.ng-untouched.ng-pristine.ng-valid[formcontrolname='status']
${CourseStatus_label}          xpath=//label[normalize-space()='Status:']
${Hobby_field}                 xpath=//input[@formcontrolname='hobby']
${Hobby_label}                 xpath=//h2[normalize-space()='Hobby']
${Document_field}              xpath=//input[@type='file']
${Document_label}              xpath=//h2[normalize-space()='Documents']
${Register_message}            xpath=//button[normalize-space()='OK']
${Register_btn}                xpath=//button[normalize-space()='Submit Registration']
${Contact_error_message}       xpath=//div[@class='masterlist-container']//div[1]//div[1]//p[1]