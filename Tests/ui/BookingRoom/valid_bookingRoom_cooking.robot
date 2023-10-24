*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser
Test Template   Validate Student Have Booking Room Have Cooking Type And Number People Of RoomType
Test Tags   BookingRoom_Cooking
#Test Tags   LV
*** Test Cases ***
TC_32: Validate Student Have Booking Room Have Cooking Type And 4 Of RoomType   ${USERNAME}   ${PASSWORD}   ${messCooking}     ${number_4}
TC_33: Validate Student Have Booking Room Have Cooking Type And 6 Of RoomType   ${USERNAME}   ${PASSWORD}   ${messCooking}     ${number_6}
TC_34: Validate Student Have Booking Room Have Cooking Type And 8 Of RoomType   ${USERNAME}   ${PASSWORD}   ${messCooking}     ${number_8}
*** Keywords ***
Validate Student Have Booking Room Have Cooking Type And Number People Of RoomType
        [Arguments]    ${USERNAME}   ${PASSWORD}   ${messCooking}   ${number_people}
        [Documentation]
        Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
        Then Verify Home Page Should Be Displayed
        And Capture and Save Screenshot
        When Navigate To The Info Student Page By Click Nav Link Info Student
        Then Verify Info Student Page Should Be Displayed
        And Check All Info Sudent With Databse  ${USERNAME}
        And Capture and Save Screenshot
        And Verify Row And Room Is't Displayed If Have Connect DB Delete  ${USERNAME}
        And Capture and Save Screenshot
        And Navigate To The Info Student Page By Click Nav Link Roomtype
        Then Verify RoomType Page Should Be Displayed
        And Capture and Save Screenshot
        And Click Choose Box Have Text  ${messCooking}
        And Click Choose Room With The Number Of People   ${number_people}
        Then Verify Room Cooking Should Be Displayed  ${number_people}
        And Capture and Save Screenshot
        And Select The Room According To The Previous Condition Steps
        And Register Room Any In List Eligible  ${USERNAME}
        And Nofication Student Want To Register Should Be Displayed
        And Capture and Save Screenshot
        And Verify Register successfully
        And Capture and Save Screenshot
        And Validate InfoStudent Page The Same Database     ${USERNAME}