*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
#Test Tags   BookingRoom
Test Tags   LV
*** Variables ***
${name_roomtype}    A2
*** Test Cases ***
TC_25: Validate Student Have Booking Room In RoomType The Select Any
        [Documentation]     This test case validate student booking  any room if students are eligible to register for a room
        [Tags]  BookingRoomAirCond
        Given Student Login Into Dormitory System     ${USERNAME_BOOKING}   ${PASS_BOOKING}
        Then Verify Home Page Should Be Displayed
        And Capture and Save Screenshot
        When Navigate To The Info Student Page By Click Nav Link Info Student
        Then Verify Info Student Page Should Be Displayed
        And Check All Info Sudent With Databse  ${USERNAME_BOOKING}
        And Capture and Save Screenshot
        And Verify Row And Room Is't Displayed If Have Connect DB Delete  ${USERNAME_BOOKING}
        And Capture and Save Screenshot
        And Navigate To The Info Student Page By Click Nav Link Roomtype
        Then Verify RoomType Page Should Be Displayed
        And Capture and Save Screenshot
        And Input Name Row Any Have In RoomType Page   ${name_roomtype}
        And Click In RoomType Student Have Choose   ${name_roomtype}
        And Register Room Any In List Eligible  ${USERNAME_BOOKING}
        And Nofication Student Want To Register Should Be Displayed
        And Capture and Save Screenshot
        And Verify Register successfully
        And Capture and Save Screenshot
        And Validate InfoStudent Page The Same Database     ${USERNAME_BOOKING}
        And Read The Response Email From The Admin

TC_38: Validate Student Have Air_conditioned And Number All
        [Documentation]     This test case validate student booking  any room if students are eligible to register for a room
        [Tags]  BookingRoomAirCond
        Given Student Login Into Dormitory System     ${USERNAME_BOOKING}   ${PASS_BOOKING}
        Then Verify Home Page Should Be Displayed
        And Capture and Save Screenshot
        When Navigate To The Info Student Page By Click Nav Link Info Student
        Then Verify Info Student Page Should Be Displayed
        And Check All Info Sudent With Databse  ${USERNAME_BOOKING}
        And Capture and Save Screenshot
        And Verify Row And Room Is't Displayed If Have Connect DB Delete  ${USERNAME_BOOKING}
        And Capture and Save Screenshot
        And Navigate To The Info Student Page By Click Nav Link Roomtype
        Then Verify RoomType Page Should Be Displayed
        And Capture and Save Screenshot
        And Click Choose Box Have Text  ${messAirConditioned}
        And Click Choose Room With The Number Of People  ${all}
        And Verifyl Room Have All Air_conditioned Should Be Displayed
        And Select The Room According To The Previous Condition Steps
        And Register Room Any In List Eligible  ${USERNAME_BOOKING}
        And Nofication Student Want To Register Should Be Displayed
        And Capture and Save Screenshot
        And Verify Register successfully
        And Capture and Save Screenshot
        And Validate InfoStudent Page The Same Database     ${USERNAME_BOOKING}
        And Read The Response Email From The Admin

TC_39: Validate Student Have Cooking And Number All
        [Documentation]     This test case validate student booking  any room if students are eligible to register for a room
        [Tags]  BookingRoomCooking
        Given Student Login Into Dormitory System     ${USERNAME_BOOKING}   ${PASS_BOOKING}
        Then Verify Home Page Should Be Displayed
        And Capture and Save Screenshot
        When Navigate To The Info Student Page By Click Nav Link Info Student
        Then Verify Info Student Page Should Be Displayed
        And Check All Info Sudent With Databse  ${USERNAME_BOOKING}
        And Capture and Save Screenshot
        And Verify Row And Room Is't Displayed If Have Connect DB Delete  ${USERNAME_BOOKING}
        And Capture and Save Screenshot
        And Navigate To The Info Student Page By Click Nav Link Roomtype
        Then Verify RoomType Page Should Be Displayed
        And Capture and Save Screenshot
        And Click Choose Box Have Text  ${messCooking}
        And Click Choose Room With The Number Of People  ${all}
        And Verify Room Have All Cooking Should Be Displayed
        And Select The Room According To The Previous Condition Steps
        And Register Room Any In List Eligible  ${USERNAME_BOOKING}
        And Nofication Student Want To Register Should Be Displayed
        And Capture and Save Screenshot
        And Verify Register successfully
        And Capture and Save Screenshot
        And Validate InfoStudent Page The Same Database     ${USERNAME_BOOKING}
        And Read The Response Email From The Admin

TC_40: Validate Student Have Colab Air_conditioned,Cook And Number All
        [Documentation]     This test case validate student booking  any room if students are eligible to register for a room
        [Tags]  BookingRoom_CollabAll
        Given Student Login Into Dormitory System     ${USERNAME_BOOKING}   ${PASS_BOOKING}
        Then Verify Home Page Should Be Displayed
        And Capture and Save Screenshot
        When Navigate To The Info Student Page By Click Nav Link Info Student
        Then Verify Info Student Page Should Be Displayed
        And Check All Info Sudent With Databse  ${USERNAME_BOOKING}
        And Capture and Save Screenshot
        And Verify Row And Room Is't Displayed If Have Connect DB Delete  ${USERNAME_BOOKING}
        And Capture and Save Screenshot
        And Navigate To The Info Student Page By Click Nav Link Roomtype
        Then Verify RoomType Page Should Be Displayed
        And Capture and Save Screenshot
        And Capture and Save Screenshot
        And Click Choose Box Have Text  ${messCooking}
        And Click Choose Box Have Text  ${messAirConditioned}
        And Click Choose Room With The Number Of People   ${all}
        Then Verify Room Have All Cooking And Air_conditioned Should Be Displayed
        And Select The Room According To The Previous Condition Steps
        And Register Room Any In List Eligible  ${USERNAME_BOOKING}
        And Nofication Student Want To Register Should Be Displayed
        And Capture and Save Screenshot
        And Verify Register successfully
        And Capture and Save Screenshot
        And Validate InfoStudent Page The Same Database     ${USERNAME_BOOKING}
        And Read The Response Email From The Admin



