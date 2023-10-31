*** Settings ***
Resource    ../../../Resource/commons/init.resource
#Test Setup     Save File Image Prev And Clear File Current Test Suite
Test Setup     Save File Image Prev And Clear File Current Test All
Test Template   Validate The Data Username And Password OF Login Successfully
Test Teardown   Close Browser Set Up Time
#Test Tags   Login
Test Tags   LV
*** Test Cases ***
TC_09: Validate Login Username And Password Should Be Successfully
    [Documentation]     This test case verifes then a student login successfully
    ...                 and verify Home Page shoule be displayed after login successfully
    [Tags]  LoginSuccessfully
  ${USERNAME}   ${PASSWORD}
*** Keywords ***
Validate The Data Username And Password OF Login Successfully
    [Arguments]     ${username}     ${password}
    Given User Open Browser And Go To Website
    Then Verify That from Fill In Username And password Are Displayed
    And Capture and Save Screenshot
    When User input Username And Password   ${username}     ${password}
    Then Verify Username and Password Is Invaid     ${username}     ${password}
    And Capture and Save Screenshot
    And Click Button Submit  ${btnSumit}
    And Wait Notification Should Be Displayed
    And Verify Home Page Should Be Displayed
    And Capture and Save Screenshot

