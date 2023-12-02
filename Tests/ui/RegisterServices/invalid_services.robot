*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
Test Template   Validate Student Have Register Services But Previous Student Are Registerd Before
Test Tags   LV
*** Test Cases ***
TC_69: Validate Student Have Send Bicycles Register But Previous Student Are Registerd Before
    [Documentation]
    [Tags]  RegisterServiceFaily
    ${USER_SERVICE_FAIL}   ${PASS_SERVICE}  ${TC_69.LICENSE_PLATE}  ${TC_69.TIME}  ${TC_69.NAME_SERVICE}
TC_70: Validate Student Have Send Motorbike Register But Previous Student Are Registerd Before
    [Documentation]
    [Tags]  RegisterServiceFaily
    ${USER_SERVICE_FAIL}   ${PASS_SERVICE}  ${TC_70.LICENSE_PLATE}  ${TC_70.TIME}  ${TC_70.NAME_SERVICE}
TC_71: Validate Student Have Send Clean The Area Register But Previous Student Are Registerd Before
    [Documentation]
    [Tags]  RegisterServiceFaily
    ${USER_SERVICE_FAIL}   ${PASS_SERVICE}  ${TC_71.LICENSE_PLATE}  ${TC_71.TIME}  ${TC_71.NAME_SERVICE}
*** Keywords ***
Validate Student Have Register Services But Previous Student Are Registerd Before
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
        And Check Service Then Student Is Previously Registered  ${name_service}
        And Navigate To The Services Page By Click Nav Link Services
        And Verify Services Page Should Be Displayed
        And Update Time According To TCs Service  ${Time}
        And Capture and Save Screenshot
        And Input Motorbike License Plate If Student Regisvices Send Motorbike  ${name_licensePlate}
        And Input Services Student Want To Register  ${name_service}
        And Capture and Save Screenshot
        And Submit Confirm Register
        Then Verify Notification Register Faily Should Be Displayed  ${mess_fail_1}  ${mess_fail_2}
        And Capture and Save Screenshot
