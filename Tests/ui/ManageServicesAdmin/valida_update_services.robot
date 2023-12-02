*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
Test Template   Validate Contains Update Services From Admin
Test Tags   LV
*** Test Cases ***
*** Keywords ***
Validate Contains Update Services From Admin
    [Arguments]     ${name}  ${prices}  ${content}  ${status}  ${name_services}  ${name_licensePlate}
    Given Admin Login Into Dormitory Manage System  ${USER_AD}  ${PASSWORD_AD}
    When Navigate To The Manage Services Page
    And Verify The Manage Serivces Page Should Be Displayed
    And Capture and Save Screenshot
    And Input Name Service Wanna Edit  ${name_services}
    And Click 'Chỉnh sửa' Then Edit Services  ${name_services}
    And Capture and Save Screenshot
    And Input The Fields You Wanna To  ${name}  ${prices}  ${content}  ${status}
    And Send By Click 'Cập nhật'
    And Verify Notification Update Succesfully
    And Login Into Dormitory Student System Then Check   ${name_services}   ${name_licensePlate}
