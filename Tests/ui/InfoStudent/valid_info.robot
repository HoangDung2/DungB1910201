*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Teardown   Close Browser
Test Tags   Info
*** Test Cases ***
TC-01: Veryfi Info Student After Login
    Given Student Login Into Dormitory System     ${TC_09.USERNAME}   ${TC_09.PASSWORD}
    Then Verify Home Page Should Be Displayed
    And Capture Page Screenshot
    When Navigate To The Info Student Page By Click Nav Link Info Student
    Then Verify Info Student Page Shoulde Be Displayed
    And Check ID Username The Same MSSV in Sudent Page  ${TC_09.USERNAME}
    And Capture Page Screenshot




