*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
Test Template   Validate Contains Update Services From Admin
Test Tags   LV
*** Test Cases ***
TC_132: Validate Update Bicycles Register Successfully And Login Dormitory Student System Then Check
    [Documentation]     This test case verify update Bicycles Register Successfully and heck
    ...                 if the parking service is working according to ${STATUS}
    [Tags]  ServicesBicycles
    ${TC_132.TITLE}   ${TC_132.PRICES}   ${TC_132.CONTENT}   ${TC_132.STATUS}   ${TC_132.NAME_SERVICES}   ${TC_132.LICENSE_PLATE}
TC_133: Validate Update Motorbike Register Successfully And Login Dormitory Student System Then Check
    [Documentation]     This test case verify Update Motorbike Register Successfully and heck
    ...                 if the parking service is working according to ${STATUS}
    [Tags]  ServicesMotorbike
    ${TC_133.TITLE}   ${TC_133.PRICES}   ${TC_133.CONTENT}   ${TC_133.STATUS}   ${TC_133.NAME_SERVICES}   ${TC_133.LICENSE_PLATE}
TC_134: Validate Update Clean Register Successfully And Login Dormitory Student System Then Check
    [Documentation]     This test case Update Clean Bicycles Register Successfully and heck
    ...                 if the parking service is working according to ${STATUS}
    [Tags]  ServicesClean
    ${TC_134.TITLE}   ${TC_134.PRICES}   ${TC_134.CONTENT}   ${TC_134.STATUS}   ${TC_134.NAME_SERVICES}   ${TC_134.LICENSE_PLATE}
*** Keywords ***
Validate Contains Update Services From Admin
    [Arguments]  ${tilte}  ${prices}  ${content}  ${status}  ${name_services}  ${name_licensePlate}
    Given Admin Login Into Dormitory Manage System  ${USER_AD}  ${PASSWORD_AD}
    When Navigate To The Manage Services Page
    And Verify The Manage Serivces Page Should Be Displayed
    And Capture and Save Screenshot
    And Input Name Service Wanna Edit  ${name_services}
    And Click 'Chỉnh sửa' Then Edit Services  ${name_services}
    And Capture and Save Screenshot
    And Input The Fields You Wanna To  ${tilte}  ${prices}  ${content}  ${status}
    And Send By Click 'Cập nhật'
    And Verify Notification Update Succesfully
    And Capture and Save Screenshot
    And Close Browser
    And Login Into Dormitory Student System Then Check   ${name_services}   ${name_licensePlate}
