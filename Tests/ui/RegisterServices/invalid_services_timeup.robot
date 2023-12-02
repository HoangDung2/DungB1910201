*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
Test Template   Validate Student Have Register Services But Register Time Up, Over Time Or Likable
Test Tags   LV
*** Test Cases ***
TC_72: Validate Student Have Send Bicycles Register But Check-In Period Overlaps With Stay Period
    [Documentation]
    [Tags]  RegisterServiceFaily
    ${USER_SERVICE}   ${PASS_SERVICE}  ${TC_72.LICENSE_PLATE}  ${TC_72.TIME}  ${TC_72.NAME_SERVICE}
TC_73: Validate Student Have Send Motorbike Register But Check-In Period Overlaps With Stay Period
    [Documentation]
    [Tags]  RegisterServiceFaily
    ${USER_SERVICE}   ${PASS_SERVICE}  ${TC_73.LICENSE_PLATE}  ${TC_73.TIME}  ${TC_73.NAME_SERVICE}
TC_74: Validate Student Have Send Clean The Area Register But Check-In Period Overlaps With Stay Period
    [Documentation]
    [Tags]  RegisterServiceFaily
    ${USER_SERVICE}   ${PASS_SERVICE}  ${TC_74.LICENSE_PLATE}  ${TC_74.TIME}  ${TC_74.NAME_SERVICE}
TC_75: Validate Student Have Send Bicycles Register But Is't Register time
    [Documentation]
    [Tags]  RegisterServiceFaily
    ${USER_SERVICE}   ${PASS_SERVICE}  ${TC_75.LICENSE_PLATE}  ${TC_75.TIME}  ${TC_75.NAME_SERVICE}
TC_76: Validate Student Have Send Motorbike Register But Is't Register time
    [Documentation]
    [Tags]  RegisterServiceFaily
    ${USER_SERVICE}   ${PASS_SERVICE}  ${TC_76.LICENSE_PLATE}  ${TC_76.TIME}  ${TC_76.NAME_SERVICE}
TC_77: Validate Student Have Send Clean The Area Register But Is't Register time
    [Documentation]
    [Tags]  RegisterServiceFaily
    ${USER_SERVICE}   ${PASS_SERVICE}  ${TC_77.LICENSE_PLATE}  ${TC_77.TIME}  ${TC_77.NAME_SERVICE}
TC_78: Validate Student Have Send Bicycles Register But Over Time
    [Documentation]
    [Tags]  RegisterServiceFaily
    ${USER_SERVICE}   ${PASS_SERVICE}  ${TC_78.LICENSE_PLATE}  ${TC_78.TIME}  ${TC_78.NAME_SERVICE}
TC_79: Validate Student Have Send Motorbike Register But Over Time
    [Documentation]
    [Tags]  RegisterServiceFaily
    ${USER_SERVICE}   ${PASS_SERVICE}  ${TC_79.LICENSE_PLATE}  ${TC_79.TIME}  ${TC_79.NAME_SERVICE}
TC_80: Validate Student Have Send Clean The Area Register But Over Time
    [Documentation]
    [Tags]  RegisterServiceFaily
    ${USER_SERVICE}   ${PASS_SERVICE}  ${TC_80.LICENSE_PLATE}  ${TC_80.TIME}  ${TC_80.NAME_SERVICE}
*** Keywords ***
Validate Student Have Register Services But Register Time Up, Over Time Or Likable
        [Documentation]
        [Arguments]  ${USERNAME}   ${PASSWORD}  ${name_licensePlate}  ${Time}  ${name_service}
        Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
        Then Verify Home Page Should Be Displayed
        And Capture and Save Screenshot
        When Navigate To The Info Student Page By Click Nav Link Info Student
        Then Verify Info Student Page Should Be Displayed
        And Check All Info Sudent With Databse  ${USERNAME}
        And Capture and Save Screenshot
        Then Verify Row And Room Have Displayed  ${USERNAME}
        And Check If The Service Student Wanna Register Has Connect DB Delete   ${USERNAME}  ${name_service}
        And Navigate To The Services Page By Click Nav Link Services
        And Verify Services Page Should Be Displayed
        And Update Time According To TCs Service  ${Time}
        And Capture and Save Screenshot
        And Input Motorbike License Plate If Student Regisvices Send Motorbike  ${name_licensePlate}
        And Input Services Student Want To Register  ${name_service}
        And Capture and Save Screenshot
        And Click Confirm Register
        Then Verify Notification Register Faily Should Be Displayed   ${mess_fail_3}    ${mess_fail_4}
        And Capture and Save Screenshot
