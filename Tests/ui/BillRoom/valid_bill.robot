*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
Test Tags   LV
*** Test Cases ***
TC_123: Verify Invoice Statistics Display Correct Data 12 Month
    [Documentation]
    [Tags]  CheckData_BillRoom
    Given Admin Login Into Dormitory Manage System  ${USER_AD}  ${PASSWORD_AD}
    When Navigate To The Bill Room Page
    And Capture and Save Screenshot
    Then Verify Bill Room Page Should Be Displayed
    And Check The Data Every Month
TC_124: Verify Invoice Statistics Display Correct Data According To Required
    [Documentation]
    [Tags]  CheckData_BillRoom
    Given Admin Login Into Dormitory Manage System  ${USER_AD}  ${PASSWORD_AD}
    When Navigate To The Bill Room Page
    And Capture and Save Screenshot
    Then Verify Bill Room Page Should Be Displayed
    And Check The Data According To Month  ${TC_124.MONTH}
TC_125: Validate Update Data Of Bill Room Successfully
    [Documentation]
    [Tags]  UpdateBill
    Given Admin Login Into Dormitory Manage System  ${USER_AD}  ${PASSWORD_AD}
    When Navigate To The Bill Room Page
    And Capture and Save Screenshot
    Then Verify Bill Room Page Should Be Displayed
    And Input RoomType And Room Update  ${TC_125.ROOTYPE}  ${TC_125.ROOM}
    Then Verify RoomType And Room Exist In List Room  ${TC_125.ROOTYPE}  ${TC_125.ROOM}
    ${Old_Sum_Money}=   Get Sum Money According To RoomType Bill    ${TC_125.ROOTYPE}  ${TC_125.ROOM}
    And Update Data Bill Room By Click Text 'Chỉnh Sửa'  ${TC_125.UPDATE_WATER}   ${TC_125.UPDATE_ELECTRIC}
    Then Verify Update Data Successfully
    And Check For Changed Data  ${TC_125.ROOTYPE}  ${TC_125.ROOM}  ${Old_Sum_Money}