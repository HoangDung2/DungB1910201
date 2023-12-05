*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Template   Validate Add Room Type Successfully
Test Teardown   Close Browser Set Up Time
Test Tags   LV
*** Test Cases ***
TC_146: Validate Contains Add Room Type Successfully And Login Into Dormitory Student System
    [Tags]  AddRoomTypeSuccessFully
    ${TC_146.ROOMTYPE}   ${TC_146.NUMBER}  ${TC_146.PRICE}   ${TC_146.IMG}    ${TC_146.ISCOOKED}  ${TC_146.ISAIRCONDITIONED}
TC_147: Validate Contains Add Room Type Successfully With Fill Name RoomType A Long String Of Characters And Login Into Dormitory Student System
    [Tags]  AddRoomTypeSuccessFully
    ${TC_147.ROOMTYPE}   ${TC_147.NUMBER}  ${TC_147.PRICE}   ${TC_147.IMG}    ${TC_147.ISCOOKED}  ${TC_147.ISAIRCONDITIONED}
*** Keywords ***
Validate Add Room Type Successfully
    [Documentation]
    [Arguments]     ${ROOMTYPE}   ${NUMBER}  ${PRICE}   ${IMG}    ${ISCOOKED}  ${ISAIRCONDITIONED}
    Given Admin Login Into Dormitory Manage System  ${USER_AD}  ${PASSWORD_AD}
    And Capture and Save Screenshot
    When Navigate To The Add Room Type Page
    And Verify The Manage The Add Room Type Page Should Be Displayed
    And Capture and Save Screenshot
    And Input Fields To Add Room   ${ROOMTYPE}   ${NUMBER}   ${PRICE}   ${IMG}    ${ISCOOKED}  ${ISAIRCONDITIONED}
    And Capture and Save Screenshot
    And Click 'Thêm' Then Add Room Type
    And Capture and Save Screenshot
    And Waiting Reload Page
    And Verify Notification Add Room Should Be Displayed
    And Navigate To The Detail Room Type Page And Check
    And Close Browser
    And Login Into Dormitory Student System Them Check Add Room Successfully    ${ROOMTYPE}