*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Teardown   Close Browser
Test Tags   RoomType
*** Test Cases ***
TC-01:Validate Room Type Have Air_conditioned And Number All.
       Given Student Login Into Dormitory System     ${TC_09.USERNAME}   ${TC_09.PASSWORD}
       Then Verify Home Page Should Be Displayed
       And Capture Page Screenshot
       When Navigate To The RoomType Page By Click Nav Link RoomType
       Then Verify RoomType Page Should Be Displayed
       And Capture Page Screenshot
       And Click Choose Box Have Text  ${messAirConditioned}
       And Click Choose Room With The Number Of People  ${all}
       And Verifyl Room Have All Air_conditioned Should Be Displayed
       And Scroll From Top to Bottom of Page And Capture Page Screenshot
TC-02:Validate Room Type Have Cooking And Number All.
       Given Student Login Into Dormitory System     ${TC_09.USERNAME}   ${TC_09.PASSWORD}
       Then Verify Home Page Should Be Displayed
       And Capture Page Screenshot
       When Navigate To The RoomType Page By Click Nav Link RoomType
       Then Verify RoomType Page Should Be Displayed
       And Capture Page Screenshot
       And Click Choose Box Have Text  ${messCooking}
       And Click Choose Room With The Number Of People  ${all}
       And Verify Room Have All Cooking Should Be Displayed
       And Scroll From Top to Bottom of Page And Capture Page Screenshot
TC-03:Validate Room Type Have Colab 'Air_conditioned,Cook' And Number All.
       Given Student Login Into Dormitory System     ${TC_09.USERNAME}   ${TC_09.PASSWORD}
       Then Verify Home Page Should Be Displayed
       And Capture Page Screenshot
       When Navigate To The RoomType Page By Click Nav Link RoomType
       Then Verify RoomType Page Should Be Displayed
       And Capture Page Screenshot
       And Click Choose Box Have Text  ${messCooking}
       And Click Choose Box Have Text  ${messAirConditioned}
       And Click Choose Room With The Number Of People   ${all}
       Then Verify Room Have All Cooking And Air_conditioned Should Be Displayed
       And Scroll From Top to Bottom of Page And Capture Page Screenshot