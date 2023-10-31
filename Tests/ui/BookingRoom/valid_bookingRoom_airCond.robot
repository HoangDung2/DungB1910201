*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
Test Template   Validate Student Have Booking Room About AirCond Type And Number People Of RoomType
#Test Tags   BookingRoom_AirCond
Test Tags   LV
*** Test Cases ***
TC_29: Validate Student Have Booking Room Have AirCond Type And 4 Of RoomType
    [Documentation]
    [Tags]  BookingRoomAirCond
    ${USERNAME}   ${PASSWORD}   ${messAirConditioned}     ${number_4}
TC_30: Validate Student Have Booking Room Have AirCond Type And 6 Of RoomType
    [Documentation]
    [Tags]  BookingRoomAirCond
    ${USERNAME}   ${PASSWORD}   ${messAirConditioned}     ${number_6}
TC_31: Validate Student Have Booking Room Have AirCond Type And 8 Of RoomType
    [Documentation]
    [Tags]  BookingRoomAirCond
    ${USERNAME}   ${PASSWORD}   ${messAirConditioned}     ${number_8}
*** Keywords ***
Validate Student Have Booking Room About AirCond Type And Number People Of RoomType
        [Arguments]   ${USERNAME}   ${PASSWORD}   ${messAirConditioned}    ${number_people}
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
        And Click Choose Box Have Text  ${messAirConditioned}
        And Click Choose Room With The Number Of People   ${number_people}
        Then Verify Room Have Air_conditioned Should Be Displayed  ${number_people}
        And Capture and Save Screenshot
        And Select The Room According To The Previous Condition Steps
        And Register Room Any In List Eligible  ${USERNAME}
        And Nofication Student Want To Register Should Be Displayed
        And Capture and Save Screenshot
        And Verify Register successfully
        And Capture and Save Screenshot
        And Validate InfoStudent Page The Same Database     ${USERNAME}