*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Template   Validate Add Room Type Faily
Test Teardown   Close Browser Set Up Time
Test Tags   LV
*** Test Cases ***
TC_149: Validate Contains Unfill From Add Room Type
    [Tags]  AddRoomTypeFail
    ${TC_149.ROOMTYPE}   ${TC_149.NUMBER}  ${TC_149.PRICE}   ${TC_149.IMG}    ${TC_149.ISCOOKED}  ${TC_149.ISAIRCONDITIONED}  ${TC_149.MESS_1}   ${TC_149.MESS_2}
TC_150: Validate Contains Fill Name RoomType Have Previous
    [Tags]  AddRoomTypeFail
    ${TC_150.ROOMTYPE}   ${TC_150.NUMBER}  ${TC_150.PRICE}   ${TC_150.IMG}    ${TC_150.ISCOOKED}  ${TC_150.ISAIRCONDITIONED}  ${TC_150.MESS_1}   ${TC_150.MESS_2}
TC_151: Validate Contains Chose Extend Different Img Have Previous
    [Tags]  AddRoomTypeFail
    ${TC_151.ROOMTYPE}   ${TC_151.NUMBER}  ${TC_151.PRICE}   ${TC_151.IMG}    ${TC_151.ISCOOKED}  ${TC_151.ISAIRCONDITIONED}  ${TC_151.MESS_1}   ${TC_151.MESS_2}
TC_152: Validate Contains Fill Number A Negative Integer
    [Tags]  AddRoomTypeFail
    ${TC_152.ROOMTYPE}   ${TC_152.NUMBER}  ${TC_152.PRICE}   ${TC_152.IMG}    ${TC_152.ISCOOKED}  ${TC_152.ISAIRCONDITIONED}  ${TC_152.MESS_1}   ${TC_152.MESS_2}
TC_153: Validate Contains Fill Price A Negative Integer
    [Tags]  AddRoomTypeFail
    ${TC_153.ROOMTYPE}   ${TC_153.NUMBER}  ${TC_153.PRICE}   ${TC_153.IMG}    ${TC_153.ISCOOKED}  ${TC_153.ISAIRCONDITIONED}  ${TC_153.MESS_1}   ${TC_153.MESS_2}
TC_154: Validate Contains Fill Number Outside 8
    [Tags]  AddRoomTypeFail
    ${TC_154.ROOMTYPE}   ${TC_154.NUMBER}  ${TC_154.PRICE}   ${TC_154.IMG}    ${TC_154.ISCOOKED}  ${TC_154.ISAIRCONDITIONED}  ${TC_154.MESS_1}   ${TC_154.MESS_2}
TC_155: Validate Contains Fill Number Less Than 2
    [Tags]  AddRoomTypeFail
    ${TC_155.ROOMTYPE}   ${TC_155.NUMBER}  ${TC_155.PRICE}   ${TC_155.IMG}    ${TC_155.ISCOOKED}  ${TC_155.ISAIRCONDITIONED}  ${TC_155.MESS_1}   ${TC_155.MESS_2}
TC_156: Validate Contains Fill Price Greater Than 0 And Not Divisible By 1000
    [Tags]  AddRoomTypeFail
    ${TC_156.ROOMTYPE}   ${TC_156.NUMBER}  ${TC_156.PRICE}   ${TC_156.IMG}    ${TC_156.ISCOOKED}  ${TC_156.ISAIRCONDITIONED}  ${TC_156.MESS_1}   ${TC_156.MESS_2}
*** Keywords ***
Validate Add Room Type Faily
    [Documentation]
    [Arguments]     ${ROOMTYPE}   ${NUMBER}  ${PRICE}   ${IMG}    ${ISCOOKED}  ${ISAIRCONDITIONED}  ${MESS_1}   ${MESS_2}
    Given Admin Login Into Dormitory Manage System  ${USER_AD}  ${PASSWORD_AD}
    And Capture and Save Screenshot
    When Navigate To The Add Room Type Page
    And Verify The Manage The Add Room Type Page Should Be   Displayed
    And Capture and Save Screenshot
    And Input Fields To Add Room   ${ROOMTYPE}   ${NUMBER}   ${PRICE}   ${IMG}  ${ISCOOKED}  ${ISAIRCONDITIONED}
    And Capture and Save Screenshot
    And Click 'Thêm' Then Add Room Type
    And Capture and Save Screenshot
    And Waiting Reload Page
    And Verify Error Notification Add Room Should Be Displayed  ${MESS_1}   ${MESS_2}
