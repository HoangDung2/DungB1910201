*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
Test Teardown   Close Browser Set Up Time Payment
Test Template   Validate Notification Student Pay Online And Input Info Card Payment
Test Tags   LV
*** Test Cases ***
*** Keywords ***
Validate Notification Student Pay Online And Input Info Card Payment
        [Documentation]
        [Arguments]   ${username}    ${password}   ${id_card}    ${name_pay}   ${date_pay}
        Given Student Login Into Dormitory System And Check All Information In InForStudent Page    ${username}  ${password}
        And Click In 'đây' Then Payment
        And Wait Page Should Be Displayed
        Then Verify VNPAY Page Should Be Displayed
        And Capture and Save Screenshot
#        ------
        And Student Input Info Card Need Payment  ${id_card}     ${name_pay}     ${date_pay}
        And Waiting Reload Page
        And Capture and Save Screenshot






