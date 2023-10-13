*** Settings ***
Resource    ../../../Resource/commons/init.resource
#Library     SeleniumLibrary
Test Teardown   Close Browser
Test Template   Validate Student Choose AirCond Type And Number People Of RoomType
Test Tags   RoomType123
*** Variables ***
*** Test Cases ***
TC-01:Validate Room Type Have AirConditioned And Number 4 people.  ${USERNAME}   ${PASSWORD}   ${messAirConditioned}   ${number_4}
TC-02:Validate Room Type Have AirConditioned And Number 6 people.    ${USERNAME}   ${PASSWORD}   ${messAirConditioned}   ${number_6}
TC-03:Validate Room Type Have AirConditioned And Number 8 people.    ${USERNAME}   ${PASSWORD}   ${messAirConditioned}   ${number_8}
*** Keywords ***
Validate Student Choose AirCond Type And Number People Of RoomType
       [Documentation]  This test case verifies then All Case Room Type Have AirConditioned
       ...              And Number input by user it will be displayed the conditon on After Login
       [Tags]  CheckRoomAirCondition
       [Arguments]  ${username}  ${password}   ${messAirConditioned}     ${number}
       Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
       Then Verify Home Page Should Be Displayed
       And Capture Page Screenshot
       When Navigate To The RoomType Page By Click Nav Link RoomType
       Then Verify RoomType Page Should Be Displayed
       And Capture Page Screenshot
       And Click Choose Box Have Text  ${messAirConditioned}
       And Click Choose Room With The Number Of People   ${number}
       Then Verify Room Have 'May Lanh' Should Be Displayed  ${number}
       And Scroll From Top to Bottom of Page And Capture Page Screenshot