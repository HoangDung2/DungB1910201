*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time
#Test Tags   FeedBack
#Test Tags   LV
*** Variables ***
${number}   5
*** Test Cases ***
TC_41: Validate Student Have Feed Back Material in Room
        [Documentation]
        [Tags]  FeedBack
        Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
        Then Verify Home Page Should Be Displayed
        And Capture and Save Screenshot
        When Navigate To The Info Student Page By Click Nav Link Info Student
        Then Verify Info Student Page Should Be Displayed
        And Check All Info Sudent With Databse  ${USERNAME}
        And Capture and Save Screenshot
        And Validate Student Has Previously Registered For The Room     ${USERNAME}
        And Capture and Save Screenshot
        And Navigate To The Info Student Page By Click Nav Link Feedback Material
        Then Verify Feedback Page Should Be Displayed
        And Update Time From Dabata Registration Material
        And Select Content Material Have Repaired Any
        And Input Number Need Repair Maximum <= 5   ${number}
        And Click Confirm
        And Verify Content Repair Have Send
        And Capture and Save Screenshot

TC_42: Validata Student Have All Feed Back Material
        [Documentation]
        [Tags]  FeedBack
        Given Student Login Into Dormitory System     ${USERNAME}   ${PASSWORD}
        Then Verify Home Page Should Be Displayed
        And Capture and Save Screenshot
        When Navigate To The Info Student Page By Click Nav Link Info Student
        Then Verify Info Student Page Should Be Displayed
        And Check All Info Sudent With Databse  ${USERNAME}
        And Capture and Save Screenshot
        And Validate Student Has Previously Registered For The Room     ${USERNAME}
        And Capture and Save Screenshot
        And Navigate To The Info Student Page By Click Nav Link Feedback Material
        Then Verify Feedback Page Should Be Displayed
        And Update Time From Dabata Registration Material
        And Select And Register All Content Material Have Repaired
