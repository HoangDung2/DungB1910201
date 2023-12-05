*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
Test Template   Verify Search Student In Manage Register Services
Test Tags   LV
*** Test Cases ***
TC_142: Verify Search Student In Manage Register Services Full Fill In Fields
    [Tags]  SearchManageServices
    ${TC_142.METHOD}  ${TC_142.MSSV}  ${TC_142.SEMESTER}  ${TC_142.SCHOOLYEAR}    ${TC_142.MAJOR}     ${TC_142.NUMBERSTUDENT}     ${TC_142.GENDER}
TC_143: Verify Search Student In Manage Register Services Full Fill But Unfill Major
    [Tags]  SearchManageServices
    ${TC_143.METHOD}  ${TC_143.MSSV}  ${TC_143.SEMESTER}  ${TC_143.SCHOOLYEAR}    ${TC_143.MAJOR}     ${TC_143.NUMBERSTUDENT}     ${TC_143.GENDER}
TC_144: Verify Search Student In Manage Register Services Full Fill But Unfill NumberStudent
    [Tags]  SearchManageServices
    ${TC_144.METHOD}  ${TC_144.MSSV}  ${TC_144.SEMESTER}  ${TC_144.SCHOOLYEAR}    ${TC_144.MAJOR}     ${TC_144.NUMBERSTUDENT}     ${TC_144.GENDER}
TC_145: Verify Search Student In Manage Register Services Full Fill But Unfill Gender
    [Tags]  SearchManageServices
    ${TC_145.METHOD}  ${TC_145.MSSV}  ${TC_145.SEMESTER}  ${TC_145.SCHOOLYEAR}    ${TC_145.MAJOR}     ${TC_145.NUMBERSTUDENT}     ${TC_145.GENDER}
TC_148: Verify Search Student In Manage Register Services By Input MSSV
    [Tags]  SearchManageServices
    ${TC_148.METHOD}  ${TC_148.MSSV}  ${TC_148.SEMESTER}  ${TC_148.SCHOOLYEAR}    ${TC_148.MAJOR}     ${TC_148.NUMBERSTUDENT}     ${TC_148.GENDER}
*** Keywords ***
Verify Search Student In Manage Register Services
    [Arguments]   ${methods}  ${MSSV}  ${semester}   ${year}   ${major}    ${buckle}  ${gender}
    Given Admin Login Into Dormitory Manage System  ${USER_AD}  ${PASSWORD_AD}
    And Capture and Save Screenshot
    When Navigate To The Manage Register Services Page
    And Verify The Manage Register Services Page Should Be Displayed
    And Input Fields To Search  ${methods}  ${MSSV}  ${semester}   ${year}   ${major}    ${buckle}  ${gender}
    And Waiting Reload Page
    And Verify Information Search Should Be Displayed