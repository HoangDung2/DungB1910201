*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
#Test Tags   RoomType
Test Tags   LV
*** Test Cases ***
TC_22:Validate Room Type Have Air_conditioned And Number All
       [Documentation]  This test case Validate then All Room Type Have Air_conditioned shoulde be displayed After Login
       [Tags]   CheckAllRoomAir
       Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
       Then Verify Home Page Should Be Displayed
       And Capture and Save Screenshot
       When Navigate To The RoomType Page By Click Nav Link RoomType
       Then Verify RoomType Page Should Be Displayed
       And Capture and Save Screenshot
       And Click Choose Box Have Text  ${messAirConditioned}
       And Click Choose Room With The Number Of People  ${all}
       And Verifyl Room Have All Air_conditioned Should Be Displayed
       And Scroll From Top to Bottom of Page And Capture Page Screenshot
TC_23:Validate Room Type Have Cooking And Number All
       [Documentation]  This test case Validate then All Room Type Have Cooking shoulde be displayed After Login
       [Tags]   CheckAllRoomCook
       Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
       Then Verify Home Page Should Be Displayed
       And Capture and Save Screenshot
       When Navigate To The RoomType Page By Click Nav Link RoomType
       Then Verify RoomType Page Should Be Displayed
       And Capture and Save Screenshot
       And Click Choose Box Have Text  ${messCooking}
       And Click Choose Room With The Number Of People  ${all}
       And Verify Room Have All Cooking Should Be Displayed
       And Scroll From Top to Bottom of Page And Capture Page Screenshot
TC_24:Validate Room Type Have Colab 'Air_conditioned,Cook' And Number All
       [Documentation]  This test case verifes then All Room Type Have Collab Air_condi and Cookiing shoulde be displayed After Login
       [Tags]   CheckAllRoomCollab
       Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
       Then Verify Home Page Should Be Displayed
       And Capture and Save Screenshot
       When Navigate To The RoomType Page By Click Nav Link RoomType
       Then Verify RoomType Page Should Be Displayed
       And Capture and Save Screenshot
       And Click Choose Box Have Text  ${messCooking}
       And Click Choose Box Have Text  ${messAirConditioned}
       And Click Choose Room With The Number Of People   ${all}
       Then Verify Room Have All Cooking And Air_conditioned Should Be Displayed
       And Scroll From Top to Bottom of Page And Capture Page Screenshot