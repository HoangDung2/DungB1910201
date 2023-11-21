*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Template   Validate The Data Username And Password OF Login Successfully
Test Teardown   Close Browser Set Up Time
#Test Tags   Login
Test Tags   LV
*** Test Cases ***
TC_113: Validate Login Username And Password Should Be Successfully
    [Documentation]     This test case verifes then a student login successfully
    ...                 and verify Home Page shoule be displayed after login successfully
    [Tags]  LoginSuccessfully_Admin
  ${TC_113.USER_AD}   ${TC_113.PASSWORD_AD}     ${TC_113.STATUS}
TC_115: Validate Login Username And Password Should Be Successfully And Logout System
    [Documentation]     This test case verifes then a student login successfully
    ...                 and verify Home Page shoule be displayed after login successfully
    [Tags]  LoginSuccessfully_Admin
  ${TC_115.USER_AD}   ${TC_115.PASSWORD_AD}     ${TC_115.STATUS}
*** Keywords ***
Validate The Data Username And Password OF Login Successfully
    [Arguments]     ${username}     ${password}  ${status}
    Given User Open Browser And Go To Website   ${NAME_PAGE_ADMIN}
    Then Verify That from Fill In Username And password Are Displayed
    And Capture and Save Screenshot
    When User input Username And Password   ${username}     ${password}
    Then Verify Username and Password Is Invaid     ${username}     ${password}
    And Capture and Save Screenshot
    And Click Button Submit  ${iptSubmit}
    And Wait Notification Should Be Displayed
    And Capture and Save Screenshot
    And Verify Manage Page Should Be Displayed
    And Logout If Admin Wanna  ${status}
    And Capture and Save Screenshot

