*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
Test Tags   LV
*** Test Cases ***
TC_129: Verify Confirm Response Material From Admin To Student
    [Documentation]  This test case verifies response material from admin to student
    ...               if any returns email to student
    [Tags]  ResponseMaterial
    Given Admin Login Into Dormitory Manage System  ${USER_AD}  ${PASSWORD_AD}
    When Navigate To The Response Material Page
    And Verify The Response Material Page Should Be Displayed
    And Capture and Save Screenshot
    And Click 'Xác nhận' Then Cofirm Reponse To Student  ${USERNAME_MATERIAL}
    And Capture and Save Screenshot
    And Input The Date Of Repair  ${TC_129.DATE}
    And Send By Click 'Gửi'
    And Verify Notification Response Meterial Should Be Displayed
    And Read Email Material