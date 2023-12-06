*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
*** Test Cases ***
TC_158: Validate Update Status Room According To RoomType Successfully
    [Documentation]
    [Tags]  158
    Given Admin Login Into Dormitory Manage System  ${USER_AD}  ${PASSWORD_AD}
    When Navigate To The Detail Room Type Page
    And Capture and Save Screenshot
    Then Verify Bill Detail Room Type Page Should Be Displayed
    And Capture and Save Screenshot
    And Update All Status For All Rooms  ${TC_158.ROOMTYPE}  ${TC_158.STATUS}
    And Capture and Save Screenshot
    And Verify Notification Update Status Room Type Successfully
    And Close Browser
    And Login Into Dormitory Student System Then Check Status Room

TC_159: Validate Send Bill Water And Electric For Room Type
    [Tags]  UpdateDeatilRoom
    Given Admin Login Into Dormitory Manage System  ${USER_AD}  ${PASSWORD_AD}
    When Navigate To The Detail Room Type Page
    And Capture and Save Screenshot
    Then Verify Bill Detail Room Type Page Should Be Displayed
    And Capture and Save Screenshot
    And Input RoomType And NumberRoom Them Send Bill  ${TC_159.ROOMTYPE}  ${TC_159.NUMBERROOM}
    And Input Data Bill Room And Send Bill  ${TC_159.WATER}   ${TC_159.ELECTRIC}
    And Capture and Save Screenshot
    And Close Browser
    And Login Into Dormitory Student System Then Check Send Bill  ${TC_159.ROOMTYPE}
    And Read Email Bill
