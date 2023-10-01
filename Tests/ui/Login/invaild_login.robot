*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Teardown   Close Browser
Test Template   Validate The Data Username And Password OF Login
*** Variables ***
${file}     Login
#   Login in name file , it use to save the image of test case login
*** Test Cases ***
TC-01: Validate Contains Unfill Username And Password.  ${TC_01.USERNAME}   ${TC_01.PASSWORD}
TC-02: Validate Contains Fill Username And Unfill Password.     ${TC_02.USERNAME}  ${TC_02.PASSWORD}
TC-03: Validate Contains Unfill Username And Fill Password.     ${TC_03.USERNAME}   ${TC_03.PASSWORD}
*** Keywords ***
Validate The Data Username And Password OF Login
    [Arguments]     ${username}     ${password}    ${locatorMessage}    ${contentMessage}
    Given User Open Browser And Go To Website
    Then Verify That from Fill In Username And password Are Displayed
    And Capture and Save Screenshot
    When User input Username And Password   ${username}     ${password}
    And Capture and Save Screenshot
    Then Verify Username and Password Is Invaid     ${username}     ${password}
    And Capture and Save Screenshot
    And Click Button Submit
    Then Verify Failed Login Message
    And Take Screenshot

