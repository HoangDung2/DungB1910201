*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser
#Test Tags   BookingRoom
#Test Tags   LV
*** Variables ***
${name_roomtype}    A3
*** Test Cases ***
TC_26: Validate Student Have Booking Room In RoomType Different From Gender
        [Documentation]     This test case validate student booking  any room if students are't eligible to register for a room
        [Tags]  BookingRoom
        Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
        Then Verify Home Page Should Be Displayed
        And Capture and Save Screenshot
        When Navigate To The Info Student Page By Click Nav Link Info Student
        Then Verify Info Student Page Should Be Displayed
        And Check All Info Sudent With Databse  ${USERNAME}
        And Capture and Save Screenshot
        And Verify Row And Room Is't Displayed If Have Connect DB Delete  ${USERNAME}
        And Navigate To The Info Student Page By Click Nav Link Roomtype
        Then Verify RoomType Page Should Be Displayed
        And Capture and Save Screenshot
        And Input Name Row Any Have In RoomType Page   ${name_roomType}
        And Click In RoomType Student Have Choose   ${name_roomType}
        And Check Register Room In RoomType Different From Gender   ${USERNAME}
        And Capture and Save Screenshot
        And Nofication Student Want To Register Should Be Displayed
        And Capture and Save Screenshot
        Then Verify Error Message Is Displayed
        And Capture and Save Screenshot

TC_27: Validate Student Have Booking Room But Previous Student Are Booked Room
        [Documentation]     This test case validate student booking  any room if students are eligible to register for a room
        [Tags]  BookingRoom
        Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
        Then Verify Home Page Should Be Displayed
        And Capture and Save Screenshot
        When Navigate To The Info Student Page By Click Nav Link Info Student
        Then Verify Info Student Page Should Be Displayed
        And Check All Info Sudent With Databse  ${USERNAME}
        And Capture and Save Screenshot
        And Verify Row And Room Have Displayed  ${USERNAME}
        And Navigate To The Info Student Page By Click Nav Link Roomtype
        Then Verify RoomType Page Should Be Displayed
        And Capture and Save Screenshot
        And Input Name Row Any Have In RoomType Page   ${name_roomtype}
        And Click In RoomType Student Have Choose   ${name_roomtype}
        And Register Room Any In List Eligible  ${USERNAME}
        And Nofication Student Want To Register Should Be Displayed
        And Veryfi Error Message Student Have Register Room


TC_28: Validate Student Have Booking Room Are Being Repaired
        [Documentation]     This test case validate student booking  any room if students are eligible to register for a room
        [Tags]  BookingRoom
        Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
        Then Verify Home Page Should Be Displayed
        And Capture and Save Screenshot
        When Navigate To The Info Student Page By Click Nav Link Info Student
        Then Verify Info Student Page Should Be Displayed
        And Check All Info Sudent With Databse  ${USERNAME}
        And Capture and Save Screenshot
        And Verify Row And Room Is't Displayed If Have Connect DB Delete  ${USERNAME}
        And Navigate To The Info Student Page By Click Nav Link Roomtype
        Then Verify RoomType Page Should Be Displayed
        And Click In RoomType Have Status Being Repaired
        Then Verify Error Message Are Being Repaired Is Displayed



