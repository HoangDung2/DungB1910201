*** Settings ***
Resource    ../../../Resource/commons/init.resource
#Library     SeleniumLibrary
Test Teardown   Close Browser
Test Template   Validate Student Choose Room Cooking And Number People Of RoomType
#Test Tags   RoomType1234
Test Tags   LV
*** Variables ***
*** Test Cases ***
TC-01:Validate Room Type Have Cooking And Number 4 people.
       [Documentation]  This test case verifies then All Case Room Type Have Cooking
       ...              And 4 people input by user it will be displayed the conditon on After Login
       ${USERNAME}   ${PASSWORD}   ${messCooking}   ${number_4}
TC-02:Validate Room Type Have Cooking And Number 6 people.
       [Documentation]  This test case verifies then All Case Room Type Have Cooking
       ...              And 6 people input by user it will be displayed the conditon on After Login
       ${USERNAME}   ${PASSWORD}   ${messCooking}   ${number_6}
TC-03:Validate Room Type Have Cooking And Number 8 people.
       [Documentation]  This test case verifies then All Case Room Type Have Cooking
       ...              And 8 people input by user it will be displayed the conditon on After Login
       ${USERNAME}   ${PASSWORD}   ${messCooking}   ${number_8}
*** Keywords ***
Validate Student Choose Room Cooking And Number People Of RoomType
       [Tags]  CheckRoomCook
       [Arguments]  ${username}  ${password}   ${messCooking}     ${number}
       Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
       Then Verify Home Page Should Be Displayed
       And Capture Page Screenshot
       When Navigate To The RoomType Page By Click Nav Link RoomType
       Then Verify RoomType Page Should Be Displayed
       And Capture Page Screenshot
       And Click Choose Box Have Text  ${messCooking}
       And Click Choose Room With The Number Of People   ${number}
       Then Verify Room Cooking Should Be Displayed  ${number}
       And Scroll From Top to Bottom of Page And Capture Page Screenshot