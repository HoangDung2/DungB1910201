*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Template   Validate The Data OF Password Change Successfully
Test Teardown   Close Browser Set Up Time
#Test Tags   Login
Test Tags   LV
*** Test Cases ***
TC_122: Validate Contains The Data OF Password Change Successfully
    [Documentation]
    [Tags]  PWDChangeSuccessfully
    ${TC_122.USER_AD}  ${TC_122.PASSWORD_AD}   ${TC_122.PASSWORD_OLD}  ${TC_122.PASSWORD_NEW}  ${TC_122.PASSWORD_CONFIRM}   ${TC_122.MESSAGE}
*** Keywords ***
Validate The Data OF Password Change Successfully
    [Arguments]     ${username}     ${password}   ${pwd_old}  ${pwd_new}  ${pwd_confirm}   ${message}
    Given Admin Login Into Dormitory Manage System  ${username}     ${password}
    When Navigate To The Info Admin Page
    Then Verify Info Admin Page Should Be Displayed
    And Capture and Save Screenshot
    And Check All Info Admin With Databse  ${username}
    When Navigate To The Password Change Page
    Then Vefiry Password Change Page Should Be Displayed
    And Capture and Save Screenshot
    And Input PassWord Wanna Change  ${pwd_old}  ${pwd_new}  ${pwd_confirm}
    And Check Password Have Filled  ${pwd_old}  ${pwd_new}  ${pwd_confirm}
    And Capture and Save Screenshot
    And Submit Confirm
    And Waiting Reload Page
    Then Verify Successfully Message Should Be Displayed  ${message}
    And Capture and Save Screenshot