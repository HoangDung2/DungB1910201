*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Teardown   Close Browser Set Up Time
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
#Test Tags   Info
Test Tags   LV
*** Test Cases ***
TC_114: Verify All Info Admin The Same Database
    [Documentation]     This test case verifies then All Info Admin in Database the same info Sudent Page After Login
    [Tags]  CheckInfoAdmin
    Given Admin Login Into Dormitory Manage System      ${USER_AD}   ${PASSWORD_AD}
    When Navigate To The Info Admin Page
    Then Verify Info Admin Page Should Be Displayed
    And Capture and Save Screenshot
    And Check All Info Admin With Databse  ${USER_AD}
    And Capture and Save Screenshot