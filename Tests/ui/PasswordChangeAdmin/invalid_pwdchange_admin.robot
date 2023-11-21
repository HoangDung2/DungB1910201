*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Template   Validate The Data OF Password Change Faily
Test Teardown   Close Browser Set Up Time
#Test Tags   Login
#Test Tags   LV
*** Test Cases ***
TC_116: Validate Contains Fill Password Old And Fill New Password And Confirm Different New Password
    [Documentation]
    [Tags]  PWDChange_Faily
    ${TC_116.USER_AD}  ${TC_116.PASSWORD_AD}   ${TC_116.PASSWORD_OLD}  ${TC_116.PASSWORD_NEW}  ${TC_116.PASSWORD_CONFIRM}   ${TC_116.MESSAGE}
TC_117: Validate Contains Unfill All Passwrods
    [Documentation]
    [Tags]  PWDChange_Faily
    ${TC_117.USER_AD}  ${TC_117.PASSWORD_AD}   ${TC_117.PASSWORD_OLD}  ${TC_117.PASSWORD_NEW}  ${TC_117.PASSWORD_CONFIRM}   ${TC_117.MESSAGE}
TC_118: Validate Contains Fill Password Old But Unfill New Password And Confirm New Password
    [Documentation]
    [Tags]  PWDChange_Faily
    ${TC_118.USER_AD}  ${TC_118.PASSWORD_AD}   ${TC_118.PASSWORD_OLD}  ${TC_118.PASSWORD_NEW}  ${TC_118.PASSWORD_CONFIRM}   ${TC_118.MESSAGE}
TC_119: Validate Contains Fill Password Old And New Password But Unfill Confirm New Password
    [Documentation]
    [Tags]  PWDChange_Faily
    ${TC_119.USER_AD}  ${TC_119.PASSWORD_AD}   ${TC_119.PASSWORD_OLD}  ${TC_119.PASSWORD_NEW}  ${TC_119.PASSWORD_CONFIRM}   ${TC_119.MESSAGE}
TC_120: Validate Contains Unfill Password Old But Fill New Password And Confirm New Password
    [Documentation]
    [Tags]  PWDChange_Faily
    ${TC_120.USER_AD}  ${TC_120.PASSWORD_AD}   ${TC_120.PASSWORD_OLD}  ${TC_120.PASSWORD_NEW}  ${TC_120.PASSWORD_CONFIRM}   ${TC_120.MESSAGE}
TC_121: Validate Contains Fill Password Old And Confirm New Password But Unfill New Password
    [Documentation]
    [Tags]  PWDChange_Faily
    ${TC_121.USER_AD}  ${TC_121.PASSWORD_AD}   ${TC_121.PASSWORD_OLD}  ${TC_121.PASSWORD_NEW}  ${TC_121.PASSWORD_CONFIRM}   ${TC_121.MESSAGE}
*** Keywords ***
Validate The Data OF Password Change Faily
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
    Then Verify Error Message Should Be Displayed  ${message}
    And Capture and Save Screenshot