*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Template   Validate The Data Username And Password OF Login Successfully
Test Teardown   Close Browser
Test Tags   Login
*** Test Cases ***
TC-01: Validate Login Username And Password Should Be Successfully.  ${TC_09.USERNAME}   ${TC_09.PASSWORD}
*** Keywords ***
Validate The Data Username And Password OF Login Successfully
    [Arguments]     ${username}     ${password}
    Given User Open Browser And Go To Website
    Then Verify That from Fill In Username And password Are Displayed
    And Capture Page Screenshot
    When User input Username And Password   ${username}     ${password}
    Then Verify Username and Password Is Invaid     ${username}     ${password}
    And Capture Page Screenshot
    And Click Button Submit     ${btnSumit}
    And Wait Notification Should Be Displayed
    And Verify Home Page Should Be Displayed
#    And Capture and Save Screenshot
