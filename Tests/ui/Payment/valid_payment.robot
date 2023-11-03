*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time Payment
Test Template   Validate Sudent Have Payment Online Or Payment Use Voucher Discount
Test Tags   LV
*** Test Cases ***
TC_81: Validate Sudent Have Payments Online Successfully
    [Documentation]
    [Tags]  Payment
    ${USER_PAYMENT}     ${PASS_PAYMENT}   ${TC_81.STATUS}
TC_82: Validate Sudent Have Payments Online And Use Voucher Discount Successfully
    [Documentation]
    [Tags]  Payment
    ${USER_PAYMENT}  ${PASS_PAYMENT}  ${TC_82.STATUS}
*** Keywords ***
Validate Sudent Have Payment Online Or Payment Use Voucher Discount
        [Documentation]
        [Arguments]     ${username}     ${password}     ${status}
        Given Student Login Into Dormitory System And Check All Information In InForStudent Page    ${username}  ${password}
        And Click In 'đây' Then Payment
        And Wait Page Should Be Displayed
        And Verify VNPAY Page Should Be Displayed
        And Capture and Save Screenshot
        And Input Full Info Card Need Payment
        And Use Voucher Discount If Student Wanna   ${status}
        And Waiting Reload Page
        And Capture and Save Screenshot
        And Click In 'Tiếp tục' Then Payment
        And Wait Page Should Be Displayed
        And Verify Confirm Payment Should Be Displayed
        And Capture and Save Screenshot
        And Input Code OTP
        And Capture and Save Screenshot
        And Click In 'Thanh Toán' Then Confirm Payment Succeslly
        And Wait Page Should Be Displayed
        And Verify Online Payment Succeslly
        And Capture and Save Screenshot



