*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
Test Template   Verify Confirm Response Material From Admin To Student Faily
Test Tags   LV
*** Test Cases ***
TC_130: Validate Contains Confirm Response Material From Admin To Student Curent Date
        [Documentation]  This test case Validate error notification response material from admin to student
       ...               if return notification faily
       [Tags]  ResponseMaterialFaily
       ${USERNAME_MATERIAL}   ${TC_130.DATE}   ${TC_130.MESS}
TC_131: Validate Contains Confirm Response Material From Admin To Student Yesterday
       [Documentation]  This test case Validate error notification response material from admin to student
       ...               if return notification faily
       [Tags]  ResponseMaterialFaily
       ${USERNAME_MATERIAL}    ${TC_131.DATE}   ${TC_131.MESS}
*** Keywords ***
Verify Confirm Response Material From Admin To Student Faily
    [Arguments]     ${id_material}     ${input_date}   ${mess}
    Given Admin Login Into Dormitory Manage System  ${USER_AD}  ${PASSWORD_AD}
    When Navigate To The Response Material Page
    And Verify The Response Material Page Should Be Displayed
    And Capture and Save Screenshot
    And Click 'Xác nhận' Then Cofirm Reponse To Student  ${id_material}
    And Capture and Save Screenshot
    And Input The Date Of Repair  ${input_date}
    And Send By Click 'Gửi'
    And Verify Error Notification Response Meterial Should Be Displayed  ${mess}
