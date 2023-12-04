*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
Test Template   Validate Student Choose Room Cooking And Number People Of RoomType
#Test Tags   RoomType
Test Tags   LV
*** Test Cases ***
TC_19:Validate Room Type Have Cooking And Number 4 people
       [Documentation]  This test case Validate then All Case Room Type Have Cooking
       ...              And 4 people input by user it will be displayed the conditon on After Login
       [Tags]  CheckRoomCook
       ${USERNAME}   ${PASSWORD}   ${messCooking}   ${number_4}
TC_20:Validate Room Type Have Cooking And Number 6 people
       [Documentation]  This test case Validate then All Case Room Type Have Cooking
       ...              And 6 people input by user it will be displayed the conditon on After Login
       [Tags]  CheckRoomCook
       ${USERNAME}   ${PASSWORD}   ${messCooking}   ${number_6}
TC_21:Validate Room Type Have Cooking And Number 8 people
       [Documentation]  This test case Validate then All Case Room Type Have Cooking
       ...              And 8 people input by user it will be displayed the conditon on After Login
       [Tags]  CheckRoomCook
       ${USERNAME}   ${PASSWORD}   ${messCooking}   ${number_8}
*** Keywords ***
Validate Student Choose Room Cooking And Number People Of RoomType
       [Arguments]  ${username}  ${password}   ${messCooking}     ${number}
       Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
       Then Verify Home Page Should Be Displayed
       And Capture and Save Screenshot
       When Navigate To The RoomType Page By Click Nav Link RoomType
       Then Verify RoomType Page Should Be Displayed
       And Capture and Save Screenshot
       And Click Choose Box Have Text  ${messCooking}
       And Click Choose Room With The Number Of People   ${number}
       Then Verify Room Cooking Should Be Displayed  ${number}
       And Scroll From Top to Bottom of Page And Capture Page Screenshot