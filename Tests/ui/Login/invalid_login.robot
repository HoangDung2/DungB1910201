*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Teardown  Close Browser
Test Template   Validate The Data Username And Password OF Login Fail
Test Tags   Login1
#Test Tags   LV
*** Test Cases ***
TC-01: Validate Contains Unfill Username And Password.
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
    ${TC_01.USERNAME}   ${TC_01.PASSWORD}   ${locatorMess}     ${messCompleteinfo}
TC-02: Validate Contains Fill Username And Unfill Password.
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
     ${TC_02.USERNAME}  ${TC_02.PASSWORD}    ${locatorMess}  ${messCompleteinfo}
TC-03: Validate Contains Unfill Username And Fill Password.
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
    ${TC_03.USERNAME}   ${TC_03.PASSWORD}   ${locatorMess}  ${messCompleteinfo}
TC-04: Validate Login Username And Password Should Be Failly.
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
    ${TC_04.USERNAME}  ${TC_04.PASSWORD}    ${locatorMess}  ${messCheckinfo}
TC-05: Validate Contains Fill Form Login Input Username By Email.
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
   ${TC_05.USERNAME}  ${TC_05.PASSWORD}    ${locatorMess}  ${messCheckinfo}
TC-06: Validate Contains Fill Form Login Input Username By Phone Number.
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
    ${TC_06.USERNAME}  ${TC_06.PASSWORD}    ${locatorMess}  ${messCheckinfo}
TC-07: Validate Contains Fill Form Login Input Username By Special characters.
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
  ${TC_07.USERNAME}  ${TC_07.PASSWORD}    ${locatorMess}  ${messCheckinfo}
TC-08: Validate Contains Fill Form Login Input Username > 50 characters.
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
   ${TC_08.USERNAME}  ${TC_08.PASSWORD}    ${locatorMess}  ${messCheckinfo}
*** Keywords ***
Validate The Data Username And Password OF Login Fail
    [Tags]  LoginFailly
    [Arguments]     ${username}     ${password}     ${locatorMessen}    ${infoMessen}
    Given User Open Browser And Go To Website
    Then Verify That From Fill In Username And Password Are Displayed
    When User input Username And Password   ${username}     ${password}
    Then Verify Username and Password Is Invaid     ${username}     ${password}
    And Click Button Submit     ${btnSumit}
    And Wait Notification Should Be Displayed
    And Verify Failed Login Message     ${locatorMessen}    ${infoMessen}
    And Capture Page Screenshot

