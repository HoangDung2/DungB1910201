*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Template   Validate The Data Username And Password OF Login Successfully
Test Teardown   Close Browser
#Test Tags   Login
Test Tags   LV
*** Test Cases ***
TC-01: Validate Login Username And Password Should Be Successfully.
    [Documentation]     This test case verifes then a student login successfully
    ...                 and verify Home Page shoule be displayed after login successfully
  ${USERNAME}   ${PASSWORD}
*** Keywords ***
Validate The Data Username And Password OF Login Successfully
    [Tags]  LoginSuccessfully
    [Arguments]     ${username}     ${password}
    Given User Open Browser And Go To Website
    Then Verify That from Fill In Username And password Are Displayed
    And Capture Page Screenshot
    When User input Username And Password   ${username}     ${password}
    Then Verify Username and Password Is Invaid     ${username}     ${password}
    And Capture Page Screenshot
    And Click Button Submit  ${btnSumit}
    And Wait Notification Should Be Displayed
    And Verify Home Page Should Be Displayed

