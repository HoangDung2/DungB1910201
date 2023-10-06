*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Teardown   Close Browser
Test Template   Validate The Data Username And Password OF Login Fail
Test Tags   Login
*** Variables ***
*** Test Cases ***
TC-01: Validate Contains Unfill Username And Password.  ${TC_01.USERNAME}   ${TC_01.PASSWORD}   ${locatorMess}     ${messCompleteinfo}
TC-02: Validate Contains Fill Username And Unfill Password.     ${TC_02.USERNAME}  ${TC_02.PASSWORD}    ${locatorMess}  ${messCompleteinfo}
TC-03: Validate Contains Unfill Username And Fill Password.     ${TC_03.USERNAME}   ${TC_03.PASSWORD}   ${locatorMess}  ${messCompleteinfo}
TC-04: Validate Login Username And Password Should Be Failly.     ${TC_04.USERNAME}  ${TC_04.PASSWORD}    ${locatorMess}  ${messCheckinfo}
*** Keywords ***
Validate The Data Username And Password OF Login Fail
    [Arguments]     ${username}     ${password}     ${locatorMessen}    ${infoMessen}
    Given User Open Browser And Go To Website
    Then Verify That From Fill In Username And Password Are Displayed
    When User input Username And Password   ${username}     ${password}
    Then Verify Username and Password Is Invaid     ${username}     ${password}
    And Click Button Submit     ${btnSumit}
    And Wait Notification Shoulde Be Displayed
    And Verify Failed Login Message     ${locatorMessen}    ${infoMessen}
    And Capture and Save Screenshot

