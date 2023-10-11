*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Teardown   Close Browser
Test Tags   Info
*** Test Cases ***
#TC-01: Veryfi Info Student After Login And Check ID Username With MSSV
#    Given Student Login Into Dormitory System     ${TC_09.USERNAME}   ${TC_09.PASSWORD}
#    Then Verify Home Page Should Be Displayed
#    And Capture Page Screenshot
#    When Navigate To The Info Student Page By Click Nav Link Info Student
#    Then Verify Info Student Page Shoulde Be Displayed
#    And Check ID Username The Same MSSV in Sudent Page  ${TC_09.USERNAME}
#    And Capture Page Screenshot
TC-02: Verify Student Has Not Registered For room And Registered Service Or MaterialRepair
    Given Student Login Into Dormitory System     ${TC_09.USERNAME}   ${TC_09.PASSWORD}
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
#TC-03: Verify All Info Student The Same Database
#    Given Student Login Into Dormitory System     ${TC_09.USERNAME}   ${TC_09.PASSWORD}
#    Then Verify Home Page Should Be Displayed
#    And Capture Page Screenshot
#    When Navigate To The Info Student Page By Click Nav Link Info Student
#    Then Verify Info Student Page Shoulde Be Displayed
#    And Capture Page Screenshot
#    And Check All Info Sudent With Databse  ${TC_09.USERNAME}
#    And Capture Page Screenshot
#
#

