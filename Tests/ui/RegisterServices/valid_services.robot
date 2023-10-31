*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
Test Template   Validate Student Have Register Services
#Test Tags   RegisterServices
Test Tags   LV
*** Test Cases ***
TC_66: Validate Student Have Send Bicycles Register
    [Documentation]
    [Tags]  RegisterService
    ${USER_SERVICE}   ${PASS_SERVICE}  ${TC_66.LICENSE_PLATE}  ${TC_66.TIME}  ${TC_66.NAME_SERVICE}
TC_67: Validate Student Have Send Motorbike Register
    [Documentation]
    [Tags]  RegisterService
    ${USER_SERVICE}   ${PASS_SERVICE}  ${TC_67.LICENSE_PLATE}  ${TC_67.TIME}  ${TC_67.NAME_SERVICE}
TC_68: Validate Student Have Send Clean The Area Register
    [Documentation]
    [Tags]  RegisterService
    ${USER_SERVICE}   ${PASS_SERVICE}  ${TC_68.LICENSE_PLATE}  ${TC_68.TIME}  ${TC_68.NAME_SERVICE}
*** Keywords ***
Validate Student Have Register Services
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
        And Check If The Service Student Wanna Register Has Connect DB Delete   ${USERNAME}    ${name_service}
        And Navigate To The Services Page By Click Nav Link Services
        And Verify Services Page Should Be Displayed
        And Update Time According To TCs Service  ${Time}
        And Capture and Save Screenshot
        And Input Motorbike License Plate If Student Regisvices Send Motorbike  ${name_licensePlate}
        And Input Services Student Want To Register  ${name_service}
        And Capture and Save Screenshot
        And Submit Confirm Register
        Then Verify Notification Register Successfully Should Be Displayed
        And Capture and Save Screenshot
        And Navigate To The Info Student Page By Click Nav Link Info Student
        Then Verify Services Information Stored In Info Student Page   ${name_service}    ${name_licensePlate}
        And Capture and Save Screenshot