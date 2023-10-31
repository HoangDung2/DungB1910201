*** Settings ***
Resource    ../../../Resource/commons/init.resource
#Test Setup     Save File Image Prev And Clear File Current Test Suite
Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
Test Template   Validate The Data Username And Password OF Login Fail
#Test Tags   Login
Test Tags   LV
*** Test Cases ***
TC_01: Validate Contains Unfill Username And Password
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
    [Tags]  LoginFailly
    ${TC_01.USERNAME}   ${TC_01.PASSWORD}   ${locatorMess}     ${messCompleteinfo}
TC_02: Validate Contains Fill Username And Unfill Password
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
    [Tags]  LoginFailly
    ${TC_02.USERNAME}  ${TC_02.PASSWORD}    ${locatorMess}  ${messCompleteinfo}
TC_03: Validate Contains Unfill Username And Fill Password
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
    [Tags]  LoginFailly
    ${TC_03.USERNAME}   ${TC_03.PASSWORD}   ${locatorMess}  ${messCompleteinfo}
TC_04: Validate Login Username And Password Should Be Failly
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
    [Tags]  LoginFailly
    ${TC_04.USERNAME}  ${TC_04.PASSWORD}    ${locatorMess}  ${messCheckinfo}
TC_05: Validate Contains Fill Form Login Input Username By Email
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
    [Tags]  LoginFailly
   ${TC_05.USERNAME}  ${TC_05.PASSWORD}    ${locatorMess}  ${messCheckinfo}
TC_06: Validate Contains Fill Form Login Input Username By Phone Number
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
    [Tags]  LoginFailly
    ${TC_06.USERNAME}  ${TC_06.PASSWORD}    ${locatorMess}  ${messCheckinfo}
TC_07: Validate Contains Fill Form Login Input Username By Special characters
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
    [Tags]  LoginFailly
  ${TC_07.USERNAME}  ${TC_07.PASSWORD}    ${locatorMess}  ${messCheckinfo}
TC_08: Validate Contains Fill Form Login Input Username Bigger 50 characters
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
    [Tags]  LoginFailly
   ${TC_08.USERNAME}  ${TC_08.PASSWORD}    ${locatorMess}  ${messCheckinfo}
*** Keywords ***
Validate The Data Username And Password OF Login Fail
    [Arguments]     ${username}     ${password}     ${locatorMessen}    ${infoMessen}
    Given User Open Browser And Go To Website
    Then Verify That From Fill In Username And Password Are Displayed
    And Capture and Save Screenshot
    When User input Username And Password   ${username}     ${password}
    Then Verify Username and Password Is Invaid     ${username}     ${password}
    And Capture and Save Screenshot
    And Click Button Submit     ${btnSumit}
    And Wait Notification Should Be Displayed
    And Verify Failed Login Message     ${locatorMessen}    ${infoMessen}
    And Capture and Save Screenshot

