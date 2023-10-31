*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Teardown   Close Browser Set Up Time
#Test Setup     Save File Image Prev And Clear File Current Test Suite
Test Setup     Save File Image Prev And Clear File Current Test All
#Test Tags   Info
Test Tags   LV
*** Test Cases ***
TC_10: Veryfi Info Student After Login And Check ID Username With MSSV
    [Documentation]     This test case verifies then input Id username by student the same
    ...                 MSSV in talble Info Sudent Page
    [Tags]  CheckIDUsername
    Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
    Then Verify Home Page Should Be Displayed
    And Capture and Save Screenshot
    When Navigate To The Info Student Page By Click Nav Link Info Student
    Then Verify Info Student Page Should Be Displayed
    And Check ID Username The Same MSSV in Sudent Page  ${USERNAME}
    And Capture and Save Screenshot
TC_11: Verify Student Has Not Registered For room And Registered Service Or MaterialRepair
    [Documentation]     This test case verifies then Student Have't Registered Room
    ...                 If Have't Registered Room then Don't Registered Service Or MaterialRepair After Login
    [Tags]  CheckRegisteredRoom
    Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
    Then Verify Home Page Should Be Displayed
    And Capture and Save Screenshot
    When Navigate To The Info Student Page By Click Nav Link Info Student
    Then Verify Info Student Page Should Be Displayed
    And Capture and Save Screenshot
    Then Verify Row And Room Is't Displayed If Have Connect DB Delete  ${USERNAME}
    And Click Nav Link MaterialRepair Then Register
    And Wait Notification Should Be Displayed
    And Capture and Save Screenshot
    And Click Button 'OK'
    And Click Nav Link Service Then Register
    And Wait Notification Should Be Displayed
    And Capture and Save Screenshot
    And Click Button 'OK'
    And Capture and Save Screenshot
TC_12: Verify All Info Student The Same Database
    [Documentation]     This test case verifies then All Info Student in Database the same info Sudent Page After Login
    [Tags]  CheckInfoStudent
    Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
    Then Verify Home Page Should Be Displayed
    And Capture and Save Screenshot
    When Navigate To The Info Student Page By Click Nav Link Info Student
    Then Verify Info Student Page Should Be Displayed
    And Capture and Save Screenshot
    And Check All Info Sudent With Databse  ${USERNAME}
    And Capture and Save Screenshot


