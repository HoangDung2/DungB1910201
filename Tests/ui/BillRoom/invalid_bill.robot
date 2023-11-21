*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
Test Template   Validate Update Data Of Bill Room Fail
Test Tags   LV
*** Test Cases ***
TC_126: Validate Contains Unfill Data Water And Electric
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
    [Tags]  UpdateBill_Faily
    ${USER_AD}   ${PASSWORD_AD}   ${TC_126.ROOMTYPE}   ${TC_126.ROOM}   ${TC_126.UPDATE_WATER}    ${TC_126.UPDATE_ELECTRIC}
TC_127: Validate Contains Fill Data Water And Unfill Electric
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
    [Tags]  UpdateBill_Faily
    ${USER_AD}   ${PASSWORD_AD}   ${TC_127.ROOMTYPE}   ${TC_127.ROOM}   ${TC_127.UPDATE_WATER}    ${TC_127.UPDATE_ELECTRIC}
TC_128: Validate Contains Unfill Data Water And Fill Ellectric
    [Documentation]  This test case verifes then a student login failly
    ...              and verify notification will be displayed username or password fail
    [Tags]  UpdateBill_Faily
    ${USER_AD}   ${PASSWORD_AD}   ${TC_128.ROOMTYPE}   ${TC_128.ROOM}   ${TC_128.UPDATE_WATER}    ${TC_128.UPDATE_ELECTRIC}
*** Keywords ***
Validate Update Data Of Bill Room Fail
    [Arguments]  ${USER_AD}  ${PASSWORD_AD}  ${ROOTYPE}  ${ROOM}   ${UPDATE_WATER}   ${UPDATE_ELECTRIC}
    Given Admin Login Into Dormitory Manage System  ${USER_AD}  ${PASSWORD_AD}
    When Navigate To The Bill Room Page
    And Capture and Save Screenshot
    Then Verify Bill Room Page Should Be Displayed
    And Input RoomType And Room Update  ${ROOTYPE}  ${ROOM}
    Then Verify RoomType And Room Exist In List Room  ${ROOTYPE}  ${ROOM}
    And Update Data Bill Room According To Input   ${UPDATE_WATER}   ${UPDATE_ELECTRIC}
    Then Verify Update Data Faily
    And Capture and Save Screenshot
