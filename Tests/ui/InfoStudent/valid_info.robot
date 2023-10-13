*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Teardown   Close Browser
#Test Tags   Info
Test Tags   LV
*** Test Cases ***
TC-01: Veryfi Info Student After Login And Check ID Username With MSSV
    [Documentation]     This test case verifies then input Id username by student the same
    ...                 MSSV in talble Info Sudent Page
    [Tags]  CheckIDUsername
    Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
    Then Verify Home Page Should Be Displayed
    And Capture Page Screenshot
    When Navigate To The Info Student Page By Click Nav Link Info Student
    Then Verify Info Student Page Shoulde Be Displayed
    And Check ID Username The Same MSSV in Sudent Page  ${USERNAME}
    And Capture Page Screenshot
TC-02: Verify Student Has Not Registered For room And Registered Service Or MaterialRepair
    [Documentation]     This test case verifies then Student Have't Registered Room
    ...                 If Have't Registered Room then Don't Registered Service Or MaterialRepair After Login
    [Tags]  CheckRegisteredRoom
    Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
    Then Verify Home Page Should Be Displayed
    And Capture Page Screenshot
    When Navigate To The Info Student Page By Click Nav Link Info Student
    Then Verify Info Student Page Shoulde Be Displayed
    And Capture Page Screenshot
    Then Verify Day And Room Is't Displayed
    And Click Nav Link MaterialRepair Then Register
    And Capture Page Screenshot
    And Click Nav Link Service Then Register
    And Capture Page Screenshot
TC-03: Verify All Info Student The Same Database
    [Documentation]     This test case verifies then All Info Student in Database the same info Sudent Page After Login
    [Tags]  CheckInfoStudent
    Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
    Then Verify Home Page Should Be Displayed
    And Capture Page Screenshot
    When Navigate To The Info Student Page By Click Nav Link Info Student
    Then Verify Info Student Page Shoulde Be Displayed
    And Capture Page Screenshot
    And Check All Info Sudent With Databse  ${USERNAME}
    And Capture Page Screenshot


