*** Settings ***
Resource    ../../../Resource/commons/init.resource
#Library     SeleniumLibrary
#Test Setup     Save File Image Prev And Clear File Current Test Suite
Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser
Test Template   Validate Student Choose AirCond Type And Number People Of RoomType
#Test Tags   RoomType
Test Tags   LV
*** Test Cases ***
TC_13:Validate Room Type Have AirConditioned And Number 4 people
       [Documentation]  This test case verifies then case Room Type Have AirConditioned
       ...              and 4 people input by user it will be displayed the conditon on After Login
       [Tags]  CheckRoomAirCondition
       ${USERNAME}   ${PASSWORD}   ${messAirConditioned}   ${number_4}
TC_14:Validate Room Type Have AirConditioned And Number 6 people
       [Documentation]  This test case verifies then case Room Type Have AirConditioned
       ...              and 6 people input by user it will be displayed the conditon on After Login
       [Tags]  CheckRoomAirCondition
       ${USERNAME}   ${PASSWORD}   ${messAirConditioned}   ${number_6}
TC_15:Validate Room Type Have AirConditioned And Number 8 people
      [Documentation]  This test case verifies then case Room Type Have AirConditioned
      ...              and 6 people input by user it will be displayed the conditon on After Login
      [Tags]  CheckRoomAirCondition
      ${USERNAME}   ${PASSWORD}   ${messAirConditioned}   ${number_8}
*** Keywords ***
Validate Student Choose AirCond Type And Number People Of RoomType
       [Arguments]  ${username}  ${password}   ${messAirConditioned}     ${number}
       Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
       Then Verify Home Page Should Be Displayed
       And Capture and Save Screenshot
       When Navigate To The RoomType Page By Click Nav Link RoomType
       Then Verify RoomType Page Should Be Displayed
       And Capture and Save Screenshot
       And Click Choose Box Have Text  ${messAirConditioned}
       And Click Choose Room With The Number Of People   ${number}
       Then Verify Room Have 'May Lanh' Should Be Displayed  ${number}
       And Scroll From Top to Bottom of Page And Capture Page Screenshot