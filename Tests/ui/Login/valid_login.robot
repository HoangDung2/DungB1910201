*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Template   Validate The Data Username And Password OF Login Successfully
Test Teardown   Close Browser
Test Tags   Login
*** Test Cases ***
TC-05: Validate Login Username And Password Should Be Successfully.  ${TC_05.USERNAME}   ${TC_05.PASSWORD}
*** Keywords ***
Validate The Data Username And Password OF Login Successfully
    [Arguments]     ${username}     ${password}
    Given User Open Browser And Go To Website
    Then Verify That from Fill In Username And password Are Displayed
    When User input Username And Password   ${username}     ${password}
    Then Verify Username and Password Is Invaid     ${username}     ${password}
    And Click Button Submit     ${btnSumit}
    And Wait Notification Shoulde Be Displayed
    And Verify Home Page Shoulde Be Displayed
    And Capture and Save Screenshot
