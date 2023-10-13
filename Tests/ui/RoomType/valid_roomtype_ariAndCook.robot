*** Settings ***
Resource    ../../../Resource/commons/init.resource
#Library     SeleniumLibrary
Test Teardown   Close Browser
Test Template   Validate Student Choose AirCond And Cooking Type And Number People Of RoomType
Test Tags   RoomType12345
*** Variables ***
*** Test Cases ***
TC-01:Validate Room Type Have Colab 'May Lanh,Cook' And Number 4 people.  ${USERNAME}   ${PASSWORD}  ${messCooking}  ${messAirConditioned}   ${number_4}
TC-02:Validate Room Type Have Colab 'May Lanh,Cook' And Number 6 people.    ${USERNAME}   ${PASSWORD}  ${messCooking}  ${messAirConditioned}   ${number_6}
TC-03:Validate Room Type Have Colab 'May Lanh,Cook' And Number 8 people.    ${USERNAME}   ${PASSWORD}  ${messCooking}  ${messAirConditioned}   ${number_8}
*** Keywords ***
Validate Student Choose AirCond And Cooking Type And Number People Of RoomType
       [Documentation]  This test case verifies then All Case Room Type Have AirConditioned And Cooking
       ...              And Number input by user it will be displayed the conditon on After Login
       [Tags]   CheckCollabRoom
       [Arguments]  ${username}  ${password}   ${messCooking}   ${messAirConditioned}     ${number}
       Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
       Then Verify Home Page Should Be Displayed
       And Capture Page Screenshot
       When Navigate To The RoomType Page By Click Nav Link RoomType
       Then Verify RoomType Page Should Be Displayed
       And Capture Page Screenshot
       And Click Choose Box Have Text  ${messCooking}
       And Click Choose Box Have Text  ${messAirConditioned}
       And Click Choose Room With The Number Of People   ${number}
       Then Verify Room Have Cooking And Air_Condi Should Be Displayed  ${number}
       And Scroll From Top to Bottom of Page And Capture Page Screenshot