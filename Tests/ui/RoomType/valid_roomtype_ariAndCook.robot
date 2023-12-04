*** Settings ***
Resource    ../../../Resource/commons/init.resource
#Library     SeleniumLibrary
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
Test Template   Validate Student Choose AirCond And Cooking Type And Number People Of RoomType
#Test Tags   RoomType
Test Tags   LV
*** Test Cases ***
TC_16:Validate Room Type Have Colab AirConditioned And Cooking And Number 4 people
       [Documentation]  This test case Validate then case Room Type Have AirConditioned And Cooking
       ...              And 4 people input by user it will be displayed the conditon on After Login
       [Tags]   CheckCollabRoom
       ${USERNAME}   ${PASSWORD}  ${messCooking}  ${messAirConditioned}   ${number_4}
TC_17:Validate Room Type Have Colab AirConditioned And Cooking' And Number 6 people
       [Documentation]  This test case Validate then case Room Type Have AirConditioned And Cooking
       ...              And 6 people input by user it will be displayed the conditon on After Login
       [Tags]   CheckCollabRoom
       ${USERNAME}   ${PASSWORD}  ${messCooking}  ${messAirConditioned}   ${number_6}
TC_18:Validate Room Type Have Colab AirConditioned And Cooking' And Number 8 people
       [Documentation]  This test case Validate then case Room Type Have AirConditioned And Cooking
       ...              And 8 people input by user it will be displayed the conditon on After Login
       [Tags]   CheckCollabRoom
       ${USERNAME}   ${PASSWORD}  ${messCooking}  ${messAirConditioned}   ${number_8}
*** Keywords ***
Validate Student Choose AirCond And Cooking Type And Number People Of RoomType
       [Documentation]  This test case Validate then All Case Room Type Have AirConditioned And Cooking
       ...              And Number input by user it will be displayed the conditon on After Login
       [Arguments]  ${username}  ${password}   ${messCooking}   ${messAirConditioned}     ${number}
       Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
       Then Verify Home Page Should Be Displayed
       And Capture and Save Screenshot
       When Navigate To The RoomType Page By Click Nav Link RoomType
       Then Verify RoomType Page Should Be Displayed
       And Capture and Save Screenshot
       And Click Choose Box Have Text  ${messCooking}
       And Click Choose Box Have Text  ${messAirConditioned}
       And Click Choose Room With The Number Of People   ${number}
       Then Verify Room Have Cooking And Air_Condi Should Be Displayed  ${number}
       And Scroll From Top to Bottom of Page And Capture Page Screenshot