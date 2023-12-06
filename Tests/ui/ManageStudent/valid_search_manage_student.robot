*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
Test Template   Verify Search Student In Manage
Test Tags   LV
*** Test Cases ***
TC_164: Verify Search Student In Manage Student System Full Fill In Fields
    [Tags]  SearchManageStudent
    ${TC_164.METHOD}  ${TC_164.MSSV}  ${TC_164.SEMESTER}  ${TC_164.SCHOOLYEAR}    ${TC_164.MAJOR}     ${TC_164.NUMBERSTUDENT}     ${TC_164.GENDER}
TC_165: Verify Search Student In Manage Student System Full Fill But Unfill Major
    [Tags]  SearchManageStudent
    ${TC_165.METHOD}  ${TC_165.MSSV}  ${TC_165.SEMESTER}  ${TC_165.SCHOOLYEAR}    ${TC_165.MAJOR}     ${TC_165.NUMBERSTUDENT}     ${TC_165.GENDER}
TC_166: Verify Search Student In Manage Student System Full Fill But Unfill NumberStudent
    [Tags]  SearchManageStudent
    ${TC_166.METHOD}  ${TC_166.MSSV}  ${TC_166.SEMESTER}  ${TC_166.SCHOOLYEAR}    ${TC_166.MAJOR}     ${TC_166.NUMBERSTUDENT}     ${TC_166.GENDER}
TC_167: Verify Search Student In Manage Student System Full Fill But Unfill Gender
    [Tags]  SearchManageStudent
    ${TC_167.METHOD}  ${TC_167.MSSV}  ${TC_167.SEMESTER}  ${TC_167.SCHOOLYEAR}    ${TC_167.MAJOR}     ${TC_167.NUMBERSTUDENT}     ${TC_167.GENDER}
TC_168: Verify Search Student In Manage Student System By Input MSSV
    [Tags]  SearchManageStudent
    ${TC_168.METHOD}  ${TC_168.MSSV}  ${TC_168.SEMESTER}  ${TC_168.SCHOOLYEAR}    ${TC_168.MAJOR}     ${TC_168.NUMBERSTUDENT}     ${TC_168.GENDER}
*** Keywords ***
Verify Search Student In Manage
    [Arguments]   ${methods}  ${MSSV}  ${semester}   ${year}   ${major}    ${buckle}  ${gender}
    Given Admin Login Into Dormitory Manage System  ${USER_AD}  ${PASSWORD_AD}
    And Capture and Save Screenshot
    When Navigate To The Manage Student Page
    And Verify The Manage Manage Student Page Should Be Displayed
    And Input Fields To Search  ${methods}  ${MSSV}  ${semester}   ${year}   ${major}    ${buckle}  ${gender}
    And Waiting Reload Page
    And Verify Information Search In Manage Student Should Be Displayed