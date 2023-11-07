*** Settings ***
Resource    ../../../Resource/commons/init.resource
Test Setup     Save File Image Prev And Clear File Current Test Suite
#Test Setup     Save File Image Prev And Clear File Current Test All
Test Teardown   Close Browser Set Up Time Payment  ${USER_PAYMENT}
Test Template   Validate Sudent Have Payment Online Room Or Payment Use Voucher Discount
Test Tags   LV
*** Test Cases ***
TC_81: Validate Sudent Have Payment Online Room Successfully
    [Documentation]
    [Tags]  Payment
    ${USER_PAYMENT}     ${PASS_PAYMENT}   ${TC_81.STATUS}
TC_82: Validate Sudent Have Payment Online And Use Voucher Discount Successfully
    [Documentation]
    [Tags]  Payment
    ${USER_PAYMENT}  ${PASS_PAYMENT}  ${TC_82.STATUS}
TC_101: Validate Noficiton Student Have Paid Online Room
    [Documentation]
    [Tags]  101
    ${USER_PAID}  ${PASS_PAID}  ${TC_101.STATUS}
*** Keywords ***
Validate Sudent Have Payment Online Room Or Payment Use Voucher Discount
        [Documentation]
        [Arguments]     ${username}     ${password}     ${status}
        Given Student Login Into Dormitory System And Check All Information In InForStudent Page    ${username}  ${password}
        And Check If The Room Student Wanna Payment Has't Return Nofication
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



